
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JavaRush Project</title>
    <!-- Bootstrap CSS -->
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <style type="text/css">
         .myrow-container {
             margin: 20px;
         }
     </style>
</head>
<body class=".container-fluid">
<div class="container myrow-container">
    <br class="panel panel-success">
    <div class="panel-heading">
        <h3 class="panel-title">
            <div align="left"><b>Users List</b> </div>
            <div align="right"><a href="/createUser">Добавить пользователя</a></div>
        </h3>
    </div>
    <br class="panel-body">
    <c:if test="${empty userList}">
        Юзеров нет. Отсутствуют:(.</br> Ничего не поделать...</br>
        Или же вы вбили пустой запрос в поиск.
        <br>
        <br>
        <a href="/getAllUsers">вернуться назад</a>
    </c:if>
    <c:if test="${not empty userList}">

        <form action="/searchUser">
            <div class="row">
                <div class="col-md-4">Поиск: <input type='text' name='searchName' id='searchName'/> </div>
                <div class="col-md-4"><input class="btn btn-success" type='submit' value='Поиск'/></div>
            </div>
        </form>


        <table class="table table-hover table-bordered">
            <thead style="background-color: #bce8f1;">
            <tr>
                <th>Id</th>
                <th>Имя</th>
                <th>Возраст</th>
                <th>Права администратора</th>
                <th>Дата создания</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="emp">
                <tr>
                    <th><c:out value="${emp.id}"/></th>
                    <th><c:out value="${emp.name}"/></th>
                    <th><c:out value="${emp.age}"/></th>
                    <th><c:out value="${emp.isAdmin}"/></th>
                    <th><c:out value="${emp.createdDate}"/></th>
                    <th><a href="/editUser?id=<c:out value='${emp.id}'/>">Редактировать</a></th>
                    <th><a href="/deleteUser?id=<c:out value='${emp.id}'/>">Удалить</a></th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </br>
        <div id="pagination">

            <c:url value="/getAllUsers" var="prev">
                <c:param name="page" value="${page-1}"/>
            </c:url>
            <c:if test="${page > 1}">
                <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
            </c:if>

            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${page == i.index}">
                        <span>${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/getAllUsers" var="url">
                            <c:param name="page" value="${i.index}"/>
                        </c:url>
                        <a href='<c:out value="${url}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="/getAllUsers" var="next">
                <c:param name="page" value="${page + 1}"/>
            </c:url>
            <c:if test="${page + 1 <= maxPages}">
                <a href='<c:out value="${next}" />' class="pn next">Next</a>
            </c:if>
        </div>

    </c:if>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<%-- <script src="<c:url value="/resources/js/jquery-2.1.3.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
 --%>

</body>
</html>