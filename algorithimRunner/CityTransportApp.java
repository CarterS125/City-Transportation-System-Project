package com.solvd.citytransportationsystemproject.algorithimRunner;

import java.util.*;
import java.util.logging.Logger;

public class CityTransportApp {
    static Logger logger = Logger.getLogger(CityTransportApp.class.getName());
    private static final int INFINITY = Integer.MAX_VALUE;
    private ArrayList<Station> stations;
    private int[][] graph;
    private int next;

    // The main method of the application where user input and program execution happens
    public static void main(String[] args) {
        CityTransportApp cityTransportation = new CityTransportApp();
        cityTransportation.initializeStations();
        cityTransportation.initializeGraph();
        Scanner scanner = new Scanner(System.in);
        logger.info("Enter start location: ");
        String start = scanner.nextLine();
        logger.info("Enter end location: ");
        String end = scanner.nextLine();
        cityTransportation.getShortestPath(start, end);
    }

    // Initializes the stations with their names and indices
    private void initializeStations() {
        stations = new ArrayList<>();
        stations.add(new Station("A", 0));
        stations.add(new Station("B", 1));
        stations.add(new Station("C", 2));
        stations.add(new Station("D", 3));
        stations.add(new Station("E", 4));
        stations.add(new Station("F", 5));
    }

    // Initializes the graph representing the connections between stations
    private void initializeGraph() {
        graph = new int[][]{{0, 5, INFINITY, INFINITY, 10, INFINITY}, {5, 0, 4, INFINITY, INFINITY, INFINITY},
                {INFINITY, 4, 0, 3, INFINITY, INFINITY}, {INFINITY, INFINITY, 3, 0, 5, INFINITY}, {10, INFINITY, INFINITY, 5, 0, INFINITY},{INFINITY, INFINITY, INFINITY,INFINITY, INFINITY, 0}};
    }

    // Finds the shortest path between the start and end locations
    private void getShortestPath(String start, String end) {
        int startIndex = -1;
        int endIndex = -1;
        for (int i = 0; i < stations.size(); i++) {
            if (stations.get(i).getName().equals(start)) {
                startIndex = i;
            }
            if (stations.get(i).getName().equals(end)) {
                endIndex = i;
            }
        }
        // If either the start or end location is not found in the list of stations, return
        if (startIndex == -1 || endIndex == -1) {
            logger.info("Invalid location entered.");
            return;
        }

        // Initializing the distances and previous arrays, and the visited array
        int[] distances = new int[stations.size()];
        int[] previous = new int[stations.size()];
        boolean[] visited = new boolean[stations.size()];
        for (int i = 0; i < stations.size(); i++) {
            distances[i] = INFINITY;
            previous[i] = -1;
            visited[i] = false;
        }
        distances[startIndex] = 0;

        for (int i = 0; i < stations.size(); i++) {
            int current = -1;
            int min = INFINITY;
            for (int j = 0; j < stations.size(); j++) {
                if (!visited[j] && distances[j] < min) {
                    current = j;
                    min = distances[j];
                }
            }
            if (current == -1) {
                break;
            }
            // Implementing the Dijkstra's algorithm
            visited[current] = true;
            for (int j = 0; j < stations.size(); j++) {
                if (!visited[j] && graph[current][j] != INFINITY) {
                    int newDistance = distances[current] + graph[current][j];
                    if (newDistance < distances[j]) {
                        distances[j] = newDistance;
                        previous[j] = current;
                    }
                }
            }
        }

        if (previous[endIndex] == -1) {
            logger.info("There is no path between " + start + " and " + end + ".");
            logger.info("Would you like us to call a taxi to your location? (yes/no)");
            Scanner scanner = new Scanner(System.in);
            String response = scanner.nextLine();
            if (response.equals("yes")) {
                logger.info("A taxi has been dispatched to your location.");
            } else {
                logger.info("Thank you for using our transportation system.");
            }
            return;
        }
        int current = next;


        // Returns the index of the station with the minimum distance that has not been visited
        ArrayList<String> path = new ArrayList<>();
        current = endIndex;
        while (current != startIndex) {
            path.add(0, stations.get(current).getName());
            current = previous[current];
        }
        path.add(0, start);
        // Print the shortest path
        logger.info("The shortest path from " + start + " to " + end + " is: ");
        for (int i = 0; i < path.size(); i++) {
            logger.info(path.get(i));
        }
        logger.info("The total distance is " + distances[endIndex] + ".");
    }

    // A class representing a station in the city transportation system
    static class Station {
        private String name;
        private int index;

        // Constructor for the Station class
        public Station(String name, int index) {
            this.name = name;
            this.index = index;
        }

        // Getter method for the name of the station
        public String getName() {
            return name;
        }

        // Getter method for the index of the station
        public int getIndex() {
            return index;
        }
    }
}