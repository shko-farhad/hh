<!DOCTYPE html>
<html>
  <head>
    <base target="_top">
    <style>
      body { font-family: Arial, sans-serif; margin: 20px; }
      .form-group { margin-bottom: 15px; }
      label { display: inline-block; width: 120px; font-weight: bold; }
      input { padding: 5px; width: 200px; }
      input[readonly] { background-color: #f0f0f0; cursor: not-allowed; }
      button { padding: 8px 15px; background-color: #4CAF50; color: white; border: none; cursor: pointer; font-weight: bold; }
      button:hover { background-color: #45a049; }
    </style>
  </head>
  <body>
    <h1>Welcome to Cloud Computing</h1>
    
    <div class="form-group">
      <label>Modules:</label> 
      <input type="text" id="modname" placeholder="Enter module name">
    </div>

    <div class="form-group">
      <label>Mark:</label> 
      <input type="number" id="mark" placeholder="Enter mark (0-100)" min="0" max="100">
    </div>

    <div class="form-group">
      <label>Grade Status:</label> 
      <input type="text" id="status" readonly placeholder="Calculated automatically...">
    </div>

    <button id="btn">Submit Data</button>

    <script> 
    const markInput = document.getElementById("mark");
    const statusInput = document.getElementById("status");
    const submitBtn = document.getElementById("btn");

    markInput.addEventListener("input", function() {
        let mark = parseFloat(markInput.value);
        
        if (isNaN(mark) || markInput.value === "") {
            statusInput.value = "";
            return;
        }

        if (mark < 50) {
            statusInput.value = "Fail";
        } else if (mark >= 50 && mark < 60) {
            statusInput.value = "Pass";
        } else if (mark >= 60 && mark < 70) {
            statusInput.value = "Good";
        } else if (mark >= 70 && mark <= 80) {
            statusInput.value = "Nice";
        } else if (mark > 80 && mark <= 100) {
            statusInput.value = "Excellent";
        } else {
            statusInput.value = "Invalid Mark";
        }
    });

    submitBtn.addEventListener("click", addModule); 

    function addModule() {
        const mname = document.getElementById("modname").value;  
        const mark = markInput.value;
        const status = statusInput.value;
        
        if(mname.trim() !== "" && mark.trim() !== "" && status !== "" && status !== "Invalid Mark") {
            google.script.run.userClicked(mname, mark, status);                   
            
            document.getElementById("modname").value = "";           
            markInput.value = "";
            statusInput.value = "";
            alert("Data submitted successfully!");
        } else {
            alert("Please fill in all fields correctly!");
        }
    }
    </script>
  </body>
</html>



function doGet() {
  return HtmlService.createHtmlOutputFromFile("lab3");
}  

function userClicked(name, mark, status) {
  const url = "https://docs.google.com/spreadsheets/d/1-YMeyAMnCKEfvASTztlVcAZ9_2thwcl2z6rH0yOS_-c/edit?gid=0#gid=0";
  const ss = SpreadsheetApp.openByUrl(url);
  const ws = ss.getSheetByName("Data"); 
  
  ws.appendRow([name, mark, status]);
}
