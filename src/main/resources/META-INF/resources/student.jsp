<%-- 
    Document   : student
    Created on : Apr 13, 2019, 2:29:38 PM
    Author     : Goshgar
--%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/Style.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Spring Boot CRUD Operations</title>
            <script>
    function setIdForDelete(delId) {
        document.getElementById("studentIdDelete").value = delId;
        return delId;
    }

      function setIdForUpdate(upId) {
        document.getElementById("studentIdUpdate").value = upId;
    }

</script>
</head>
<body background="https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjBiqO7ic7hAhXBbFAKHYBPADQQjRx6BAgBEAU&url=https%3A%2F%2Fwallpaperscraft.com%2Fdownload%2Fbeach_sand_palm_trees_tropical_90404%2F1920x1080&psig=AOvVaw2fMwyQ2fJ3A1MJG6PS-cCs&ust=1555279392181903">

<form:form
        method="get"
      action="/students/search"
      modelAttribute="student">
    <form:input path="name" class="text-input"  />
   <input type="submit" value="Search"/>
</form:form>
<table class="table" id="studentTable">
    <thead>
    <th>#</th>
    <th>Name</th>
    <th>Surname</th>
    <th>Age</th>
    <th>Operations</th>
    </thead>

    <tbody>
    <c:set  var="number" value="${1}"/>
    <c:forEach items="${studentList}" var="item">
        <tr>

            <td>${number=1}</td>
            <td>${item.name}</td>
            <td>${item.surname}</td>
            <td>${item.age}</td>
            <td>
                <input type="submit" class="btn btn-warning" onclick="setIdForUpdate(${item.id})" data-toggle="modal"
                       data-target="#myUpdateModal" value="Edit"/>
                <input type="submit" class="btn btn-danger" data-toggle="modal" onclick="setIdForDelete(${item.id})"
                       data-target="#myDeleteModal" value="Delete"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="modal fade" id="myDeleteModal" role="dialog">
    <div class="modal-dialog">


        <div class="modal-content">
                           <form:form
                           action="/students/delete"
                           modelAttribute="student"
                           >
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h6>Delete Student</h6>
                                </div>
                                <div class="modal-body">
                                    <p>Are you want to delete this person?</p>
                                </div>
                                <div class="modal-footer">
                                    <form:hidden path="id" id="studentIdDelete"/>
                                    <input type="hidden" name="action" value="delete"/>
                                    <input type="submit" class="btn btn-danger" value="Yes"/>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                </div>
                            </form:form>
        </div>

    </div>
</div>
<div class="modal fade" id="myUpdateModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h6 class="modal-title">Update Student</h6>
            </div>

                <form:form class="form-group"
                method="get"
                modelAttribute="studentu"
                action="/students/update">
                <p>Enter new values</p>
                <form:input path="name" class="form-control"/>

                <form:input path="surname" class="form-control"/>

                <form:input path="age" class="form-control"/>

                <div class="modal-footer">
                  <form:hidden path="id" id="studentIdUpdate"/>
                    <input type="hidden" name="action" value="update"/>
                    <input type="submit" class="btn btn-dark " value="Save"/>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </form:form>
        </div>

    </div>
</div>
<form:form
        method="POST"
        class="form-inline"
        action="/students"
        modelAttribute="student">
    <table id="addStudent">
        <tr>
            <td><form:label path="name">Name</form:label></td>
            <td><form:input path="name" class="form-control" required="required"/></td>
        </tr>
        <tr>
            <td><form:label path="surname">Surname</form:label></td>
            <td><form:input path="surname" class="form-control" required="required"/></td>
        </tr>
        <tr>
            <td><form:label path="age">Age</form:label></td>
            <td><form:input path="age" class="form-control" required="required"/></td>
        </tr>

        <tr>
            <td><input type="submit" value="Add" class="btn btn-default"/></td>
        </tr>
    </table>
</form:form>


</body>
</html>

