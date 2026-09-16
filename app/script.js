function generateBarcode() {

    var value = document.getElementById("barcodeInput").value;

    if (value == "") {
        alert("Please enter a value");
        return;
    }

    JsBarcode("#barcode", value, {
        format: "CODE128",
        displayValue: true
    });
}