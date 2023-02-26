<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Registration Form</title>
    <style type="text/css">
        label {
            display: inline-block;
            width: 100%;
            margin: 5px;
            text-align: left;
        }
        input[type=text], input[type=password], select, textarea {
            width: 100%;
        }
        input[type=radio] {
            display: inline-block;
            margin-left: auto;
        }

        button {
            padding: 10px;
            margin: 10px;
        }
    </style>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#consumerLst').DataTable({
                pageLength : 10,
                ajax : {
                    url : '${pageContext.request.contextPath}/data/getdata',
                    dataSrc : ''
                },
                columns : [ {
                    title : 'Id',
                    data : 'id'
                }, {
                    title : 'Nama',
                    data : 'nama'
                }, {
                    title : 'Alamat',
                    data : 'alamat'
                }, {
                    title : 'Kota',
                    data : 'kota'
                }, {
                    title : 'Provinsi',
                    data : 'provinsi'
                }, {
                    title : 'Tanggal Registrasi',
                    data : 'tglRegistrasi',
                    render: function(data) {
                        const format = "DD-MM-YYYY"
                        return moment(data).format(format);
                    }
                },{
                    title : 'Status',
                    data : 'status'
                } ]
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <h2>Add Consumer</h2>
            <div class="card">
                <div class="card-body">
                    <form:form action="add" method="post" modelAttribute="consumer">
                        <div class="form-group row">
                            <form:label path="nama" class="col-sm-3 col-form-label">Nama:</form:label>
                            <div class="col-sm-7">
                                <form:input path="nama"/><br/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <form:label path="alamat" class="col-sm-3 col-form-label">Alamat:</form:label>
                            <div class="col-sm-7">
                                <form:textarea path="alamat" cols="25" rows="3"/><br/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <form:label path="kota" class="col-sm-3 col-form-label">Kota:</form:label>
                            <div class="col-sm-7">
                                <form:input path="kota"/><br/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <form:label path="provinsi" class="col-sm-3 col-form-label">Provinsi:</form:label>
                            <div class="col-sm-7">
                                <form:input path="provinsi"/><br/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <form:label path="tglRegistrasi" class="col-sm-3 col-form-label">Tanggal Registrasi:</form:label>
                            <div class="col-sm-7">
                                <form:input path="tglRegistrasi"/><br/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <form:label path="status" class="col-sm-3 col-form-label">Status:</form:label>
                            <div class="col-sm-7">
                                <form:radiobutton path="status" value="aktif"/>Aktif
                                <form:radiobutton path="status" value="non-Aktif"/>Non-Aktif<br/>
                            </div>
                        </div>

                        <form:button class="btn btn-primary">Add</form:button>
                    </form:form>
                </div>
            </div>

        <div>
            <h2>Consumer List</h2>
            <table id="consumerLst" class="display"></table>
        </div>
    </div>



</body>
<script>
    $(function() {
        $( "input[name=tglRegistrasi]" ).datepicker({
            inline: true,
            dateFormat: 'dd-mm-yy'
        });
    });
</script>
</html>