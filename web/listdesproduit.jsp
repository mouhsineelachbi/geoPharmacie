<%@page import="GeoPharmacie.Produit"%>
<%@page import="java.util.LinkedList"%>
<%@page import="GeoPharmacie.baseD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>stock</title>
    </head>
    <body>
        <% baseD db = new baseD(); %>
        <form  action="descriptionProduit" method="POST">
        <table border=2 >
            <tr>
                <th>REFERENCE PRODUIT</th>
                <th>LIBELLE</th>
                <th>PRIX</th>
                <th>TEMPERATURE</th>
                <th>DATE D'EXPIRATION</th>
                <th> DATE DE FABRICATION</th>
                <th> MODIFIER </th>
            </tr>
            <%
                String cin = new String();
                Cookie[] ck = request.getCookies();
                if(ck != null) {
                    for (int i = 0; i < ck.length; i++) {
                        Cookie cookie = ck[i];
                        String name = cookie.getName();
                        String value = cookie.getValue();
                        if(name.equals("username")){
                            cin = value;
                            break;
                        }
                    }
                }
                
                LinkedList<Produit> produitList = db.listProduit();
                for(Produit p:produitList){
                    
                %>
            <tr>
                <td><input type="text" name="reference" value=<%=p.getReferenceProduit()%>></td>
                <td><input type="text" name="libelle" value=<%=p.getLibelle()%>></td>
                <td><input type="text" name="prix" value=<%=p.getPrix()%>></td>
                <td><input type="text" name="temp" value=<%=p.getTemperatureStock()%>></td>
                <td><input type="date" name="dateex" value=<%=p.getDateExpiration()%>></td>
                <td><input type="date" name="datefab" value=<%=p.getDateFabrication()%>></td>
                    <input type="hidden" name="numproduit" value=<%=p.getNumeroProduit()%>>
                <td><center><input type="submit" value="plus informations"/></center></td>
            </tr>
                <%
                    }
                    %>
        </table>
        </form>
    </body>
</html>
