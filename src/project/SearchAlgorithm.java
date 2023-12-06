package project;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class SearchAlgorithm {

    JTextField txtSearch;
    JTable tbl;
    DefaultTableModel tblMdl;

    Object[][] data;

    SearchAlgorithm(JTextField txtSearch, JTable tbl){

        this.txtSearch=txtSearch;
        this.tbl=tbl;
        tblMdl=(DefaultTableModel) tbl.getModel();

        data = new Object[tbl.getRowCount()][tbl.getColumnCount()];

        for (int i=0;i<tbl.getRowCount();i++){
            for (int j=0;j<tbl.getColumnCount();j++){
                data[i][j]=tbl.getValueAt(i,j);
                System.out.println(data[i][j]);
            }
        }


        txtSearch.getDocument().addDocumentListener(new DocumentListener() {
            @Override
            public void insertUpdate(DocumentEvent e) {
                filterTable();
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                filterTable();
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                filterTable();
            }
        });
    }

    private void filterTable() {
        // Get the search text
        String searchText = txtSearch.getText().toLowerCase();

        // Clear the current rows in the table...
        tblMdl.setRowCount(0);

        // Filter and add rows based on the search text...
        for (int i = 0; i < data.length; i++) {
            boolean match = false;
            for (int j = 0; j < data[i].length; j++) {
                String cellValue = String.valueOf(data[i][j]).toLowerCase();
                if (cellValue.contains(searchText)) {
                    match = true;
                    break;
                }
            }
            if (match) {
                tblMdl.addRow(data[i]);
            }
        }
    }
}
