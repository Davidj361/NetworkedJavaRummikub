package Rummikub;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;


public class Server extends Thread implements AutoCloseable {

    private int maxClients = 3;
    private int port = 27015;
    private String name = "unnamed"; // Name for the host player
    private ServerSocket socket;
    ArrayList<ClientHandler> clients = new ArrayList<>();
    Game game = null;
    boolean testing;

    Server() {
        this(false);
    }
    Server(boolean b) {
        testing = b;
    }
    Server(String name, int port, int numPlayers) {
        this(name, port, numPlayers, false);
    }
    Server(String name, int port, int numPlayers, boolean b) {
        this.name = name;
        this.port = port;
        this.maxClients = numPlayers-1; // subtract host
        this.testing = b;
    }

    public void run() {
        System.out.println("Server Running");
        System.out.println("Waiting for clients to connect...");
        while (isOpen()) {
            try {
                accept();
            } catch (SocketException e) {
                // Not a big deal
                System.out.println("Server stopped");
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean accept() throws IOException {
        if (!isOpen() || clients.size() == maxClients)
            return false;
        Socket s = socket.accept();
        if (socket != null && s != null) {
            clients.add(new ClientHandler(this, s, clients.size(), testing));
            clients.get(clients.size()-1).start();
            print("Host: Client " + (clients.size()-1) + " connected.\n", 0);
            return true;
        }
        return false;
    }

    public boolean host() throws IOException {
        if (!isOpen()) {
            socket = new ServerSocket(port);
            return true;
        }
        return false;
    }

    public boolean stopHost() throws IOException {
        return stopHost(false);
    }

    private boolean stopHost(boolean force) throws IOException {
        if (force || isOpen()) {
            for (ClientHandler c : clients) {
                if (c != null)
                    c.close();
            }
            socket.close();
            socket = null;
            return true;
        }
        return false;
    }

    public boolean isOpen() {
        return socket != null && !socket.isClosed();
    }

    public void close() throws IOException {
        stopHost();
    }

    public boolean isBound() { return socket.isBound(); }
    public boolean isClosed() { return socket.isClosed(); }

    public boolean send(final int iClient, String str) {
        if (clients.get(iClient) == null)
            throw new IllegalStateException();
        return clients.get(iClient).send(str);
    }

    public String read(final int iClient) throws IOException {
        if (clients.get(iClient) == null)
            throw new IllegalStateException();
        return clients.get(iClient).read();
    }

    public void print(String str) {
        System.out.print(str);
        for (int i=0; i<clients.size(); i++) {
            try {
                send(i, str);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    public void print(String str, int idx) {
        if (idx == 0)
            System.out.print(str);
        else {
            try {
                send(idx-1, str);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

	/*
	public void reset() throws IOException {
		for (int i=0; i<clientsConnected; i++)
			clients[i].reset();
	}
	*/

    // When the host asks for a command
    public boolean command(String str) {
        if (!commHelper(0, str)) {
            return false;
        }
        return true;
    }

    // When client asks for a command
    public boolean command(int clientId, String str) {
        final int player = clientId+1;
        if (game == null) {
            print("Game hasn't started yet.", player);
            return false;
        }
        if (!commHelper(player, str)) {
            return false;
        }
        return true;
    }

    private boolean commHelper(int player, String str) {
        return game.command(player, str);
    }

    public int getNumClients() {
        return clients.size();
    }

    public int getMaxClients() {
        return maxClients;
    }

    public ArrayList<String> getNames() {
        ArrayList<String> names = new ArrayList<>();
        names.add(name);
        for (ClientHandler h: clients)
            names.add(h.getPlayerName());
        return names;
    }

    // Needed because we need to wait for all clients to send their names for checking syncing
    public ArrayList<String> getNamesSet() {
        ArrayList<String> names = new ArrayList<>();
        names.add(name);
        for (ClientHandler h: clients) {
            String name = h.getPlayerName();
            if (!name.contains("unnamed"))
                names.add(name);
        }
        return names;
    }

}
