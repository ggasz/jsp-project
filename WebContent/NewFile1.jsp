<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css"
 href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
 
<script>
    $(function(){
        $("#tablesort").dataTable();
    });
</script>
</head>
 
<body>
    <table id="tablesort">
        <thead>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>country</th>
            </tr>    
        </thead>
        <tbody>
            <tr>
                <td>A01</td>
                <td>namju</td>
                <td>korea</td>
            </tr>
            
            <tr>
                <td>C01</td>
                <td>hyunwoo</td>
                <td>japan</td>
            </tr>
            <tr>
                <td>B03</td>
                <td>sangil</td>
                <td>china</td>
            </tr>
            <tr>
                <td>D02</td>
                <td>junjung</td>
                <td>french</td>
            </tr>
            <tr>
                <td>F01</td>
                <td>jaehun</td>
                <td>US</td>
            </tr>
            <tr>
                <td>G01</td>
                <td>minho</td>
                <td>Austrailia</td>
            </tr>
        </tbody>
 
    </table>
</body>
</html>