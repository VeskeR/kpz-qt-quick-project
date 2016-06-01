import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3

Window {
    id: mainWindow
    title: "Cool QML project"
    visible: true
    width: 900
    height: 400

    ListModel {
        id: studentsModel
        ListElement {
            ID: 1
            firstName: "Andrey"
            lastName: "Bulat"
            email: "andrii.bulat@gmail.com"
            phone: "0505681222"
            department: "FIOT"
            group: "IT-41"
            year: 2
        }
        ListElement {
            ID: 2
            firstName: "Andrey"
            lastName: "Iasko"
            email: "andrii.iasko@gmail.com"
            phone: "0507777444"
            department: "FIOT"
            group: "IT-41"
            year: 2
        }
    }

    Dialog {
        id: createStudentDialog
        modality: Qt.WindowModal
        title: "Create Student"
        standardButtons: StandardButton.Ok | StandardButton.Cancel
        onAccepted: {
            studentsModel.append({"ID": studentsModel.count + 1, "firstName": tfFirstName.text, "lastName": tfLastName.text, "email": tfEmail.text, "phone": tfPhone.text, "department": tfDepartment.text, "group": tfGroup.text, "year": parseInt(cbYear.currentText)})
            tfFirstName.text = ""
            tfLastName.text = ""
            tfEmail.text = ""
            tfPhone.text = ""
            tfDepartment.text = ""
            tfGroup.text = ""
            cbYear.currentText = "1"
        }

        Column {
            Row {
                spacing: 40
                Label {
                    text: "First Name:"
                }

                TextField {
                    id: tfFirstName
                }
            }
            Row {
                spacing: 40
                Label {
                    text: "Last Name:"
                }

                TextField {
                    id: tfLastName
                }
            }
            Row {
                spacing: 40
                Label {
                    text: "Email:"
                }

                TextField {
                    id: tfEmail
                }
            }
            Row {
                spacing: 40
                Label {
                    text: "Phone:"
                }

                TextField {
                    id: tfPhone
                }
            }
            Row {
                spacing: 40
                Label {
                    text: "Department:"
                }

                TextField {
                    id: tfDepartment
                }
            }
            Row {
                spacing: 40
                Label {
                    text: "Group:"
                }

                TextField {
                    id: tfGroup
                }
            }
            Row {
                spacing: 40
                Label {
                    text: "Year:"
                }

                ComboBox {
                    id: cbYear
                    width: 50
                    model: [ "1", "2", "3", "4", "5", "6" ]
                }
            }
        }
    }

    Column {
        Row {
            id: controls
            Button {
                id: btnCreateStudent
                text: "Create Student"
                onClicked: {
                    createStudentDialog.open()
                }
            }
            Button {
                id: btnDeleteStudent
                text: "Delete Student"
                onClicked: {
                    studentsModel.remove(studentsView.currentRow, 1)
                }
            }
        }

        Row {
            TableView {
                id: studentsView
                width: mainWindow.width
                height: mainWindow.height - controls.height
                model: studentsModel

                TableViewColumn {
                    role: "ID"
                    title: "Id"
                    width: 40
                }
                TableViewColumn {
                    role: "firstName"
                    title: "First Name"
                    width: 200
                }
                TableViewColumn {
                    role: "lastName"
                    title: "Last Name"
                    width: 150
                }
                TableViewColumn {
                    role: "phone"
                    title: "Email"
                    width: 150
                }
                TableViewColumn {
                    role: "phone"
                    title: "Phone"
                    width: 100
                }
                TableViewColumn {
                    role: "department"
                    title: "Department"
                    width: 100
                }
                TableViewColumn {
                    role: "group"
                    title: "Group"
                    width: 80
                }
                TableViewColumn {
                    role: "year"
                    title: "Year"
                    width: 50
                }
            }
        }
    }
}
