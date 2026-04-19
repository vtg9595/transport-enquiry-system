package com.transport.controller;

import com.jfoenix.controls.*;
import com.transport.model.Transport;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import java.time.LocalDateTime;

public class AdminController {
    @FXML private JFXTextField vehicleNumberField;
    @FXML private JFXTextField routeNumberField;
    @FXML private JFXTextField sourceField;
    @FXML private JFXTextField destinationField;
    @FXML private JFXTextField fareField;
    @FXML private JFXTextField seatsField;
    @FXML private JFXComboBox<String> transportTypeCombo;
    @FXML private TableView<Transport> transportTable;

    @FXML
    public void initialize() {
        setupTransportTypeCombo();
        setupTable();
    }

    private void setupTransportTypeCombo() {
        transportTypeCombo.getItems().addAll("Bus", "Train");
        transportTypeCombo.setValue("Bus");
    }

    private void setupTable() {
        TableColumn<Transport, String> vehicleCol = new TableColumn<>("Vehicle No.");
        vehicleCol.setCellValueFactory(new PropertyValueFactory<>("vehicleNumber"));

        TableColumn<Transport, String> routeCol = new TableColumn<>("Route");
        routeCol.setCellValueFactory(new PropertyValueFactory<>("routeNumber"));

        TableColumn<Transport, String> sourceCol = new TableColumn<>("Source");
        sourceCol.setCellValueFactory(new PropertyValueFactory<>("source"));

        TableColumn<Transport, String> destCol = new TableColumn<>("Destination");
        destCol.setCellValueFactory(new PropertyValueFactory<>("destination"));

        TableColumn<Transport, Double> fareCol = new TableColumn<>("Fare");
        fareCol.setCellValueFactory(new PropertyValueFactory<>("fare"));

        TableColumn<Transport, Integer> seatsCol = new TableColumn<>("Seats");
        seatsCol.setCellValueFactory(new PropertyValueFactory<>("availableSeats"));

        transportTable.getColumns().addAll(vehicleCol, routeCol, sourceCol, destCol, fareCol, seatsCol);
    }

    @FXML
    private void handleAdd() {
        try {
            String vehicleNumber = vehicleNumberField.getText();
            String routeNumber = routeNumberField.getText();
            String source = sourceField.getText();
            String destination = destinationField.getText();
            double fare = Double.parseDouble(fareField.getText());
            int seats = Integer.parseInt(seatsField.getText());
            String type = transportTypeCombo.getValue();

            Transport transport = new Transport(
                vehicleNumber, routeNumber, source, destination,
                LocalDateTime.now(), LocalDateTime.now().plusHours(2),
                fare, seats, type
            );

            transportTable.getItems().add(transport);
            clearFields();
        } catch (NumberFormatException e) {
            // Handle invalid number input
            System.err.println("Invalid number format");
        }
    }

    @FXML
    private void handleDelete() {
        Transport selected = transportTable.getSelectionModel().getSelectedItem();
        if (selected != null) {
            transportTable.getItems().remove(selected);
        }
    }

    private void clearFields() {
        vehicleNumberField.clear();
        routeNumberField.clear();
        sourceField.clear();
        destinationField.clear();
        fareField.clear();
        seatsField.clear();
        transportTypeCombo.setValue("Bus");
    }
}
