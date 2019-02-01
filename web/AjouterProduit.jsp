<%@page import="GeoPharmacie.Pharmacien"%>
<%@page import="java.util.LinkedList"%>
<%@page import="GeoPharmacie.baseD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Geophar</title>
        <link href="PgC.css" rel="stylesheet" media="all"/>
    </head>
    <body>
         <% 
            HttpSession sessio=request.getSession();
            if(sessio.getAttribute("password")!=null)
            {
    %>
    <% int idPharmacie=0;
                    Cookie [] idpharmaci=request.getCookies();
                               for(int i=0;i<idpharmaci.length;i++)
                               {
                                   if((idpharmaci[i].getName()).equals("idPharmacie") ){
                                       idPharmacie=Integer.parseInt(idpharmaci[i].getValue());
                                   }
                               }
                               %>
                               
      <%
                baseD op=new baseD();
               Pharmacien cl= op.selectPharmacien(idPharmacie);
                
                %>
                
                <div class="Pc">
                    <c:if test="${!empty sessionScope.cin && !empty sessionScope.password}">
                <p>  Bienvenue ${sessionScope.nom} ${sessionScope.prenom}
                <!-- Bon Journéé Mr.<%=cl.getNom()%>  <%=cl.getPrenom()%>--></p>
                    <form>
                    <input disabled="disabled" name="nom" value="<%=cl.getNom() %>" class="txtb">
                    <input disabled="disabled" name="prenom" value="<%=cl.getPrenom() %>" class="txtb">
                    <input disabled="disabled" name="email" value="<%=cl.getEmail() %>" class="txtb">
                    <input disabled="disabled" name="cin" value="<%=cl.getCin() %>" class="txtb">
                    <input disabled="disabled" name="adresse" value="<%=cl.getAdresse() %>" class="txtb">
                    <input disabled="disabled" name="pseudo" value="<%=cl.getPseudo()%>" class="txtb">
                    <input disabled="disabled" name="tel" value="<%=cl.getTel()%>" class="txtb">
                    <input disabled="disabled" name="idpharmacie" value="<%=cl.getIdPharmacie() %>" class="txtb">
             </form>
                     <form action="ModifierPharmacien" method="post">
                            <input type="hidden" name="numeroPharmacien" value="<%=cl.getNumeroPharmacien()%>"/>
                            <input type="hidden" name="nom" value="<%=cl.getNom()  %>"/>
                            <input type="hidden" name="prenom" value="<%=cl.getPrenom()  %>"/>
                            <input type="hidden" name="cin" value="<%=cl.getCin()  %>"/>
                            <input type="hidden" name="email" value="<%=cl.getEmail()  %>"/>
                            <input type="hidden" name="adresse" value="<%=cl.getAdresse() %>"/>
                             <input type="hidden" name="pseudo" value="<%=cl.getPseudo()  %>"/>
                            <input type="hidden" name="tele" value="<%=cl.getTel() %>"/>
                            <input type="hidden" name="motdepasse" value="<%=cl.getMotDePasse() %>"/>
                            <input type="hidden" name="idpharmacie" value="<%=cl.getIdPharmacie() %>"/>
                           <input type="hidden" name="action" value="ModifierPharmacien"/>
                             <input type="submit" value="Modifier les informations" class="signup-btn">
                                       
                    </form>
                           <form action="AjouterPharmacie" method="post">
                               <input type="hidden" name="idPharmacie" value="<%=cl.getIdPharmacie() %>"/>
                               <input type="submit" value="Afficher les Informations de la pharmacie" class="signup-btn">
                               <input type='hidden' name="action" value="Afficher"/>
                           </form>      
                               
            <b style="color: green;">
                                
        <%
                String message=(String)request.getAttribute("message");
                if(message !=null)
                {
                   out.print(message);
                }
            
        %>    
            </b>
                </div>
            <div class="tl">
            
            
                <nav class="menu">
                    
                        <a><img src="bg3.png" alt=""/></a>
                    
                    
            <form action="SRechercheProduit" method="post" class="search-form">
                <input name="libelle" class="sf"/> 
                
               <input type="hidden" name="action" value="rechercher"/>
               <input type="submit" value="Rechercher" class="RP">
            </form>
                    
                    <dive class="opt">
            <ul>
                <li><form action="ModifierPharmacien" method="post">
                                  <input type="hidden" name="idpharmacie" value="<%=cl.getIdPharmacie() %>"/> 
                                  <input type="hidden" name="action" value="dateferie"/>
                                  <input id="3" type="submit" value="Ajouter une date Ferie" class="optn">
                                       
                        </form>
                    
                </li>
                
                <li><form action="ModifierPharmacien" method="post">
                                  <input type="hidden" name="idpharmacie" value="<%=cl.getIdPharmacie() %>"/> 
                                  <input type="hidden" name="action" value="dategarde"/>
                                  <input id="4" type="submit" value="Ajouter une date de garde" class="optn">
                                       
                        </form>
                    
                </li>
                 
                
                <li><form action="ModifierPharmacien" method="post">
                    <input type="hidden" name="idpharmacie" value="<%=cl.getIdPharmacie() %>"/> 
                    <input type="hidden" name="action" value="listpharm"/>
                    <input type="submit" value="list de tout les pharmacies" class="optn">
                       </form>
                    
                </li>
                <li><form action="ajouterProduit" method="post">
                  
                    <input type="hidden" name="action" value="AjoutProd"/>
                    <input id="5" type="submit" value="Ajouter produit" class="optn">
                       </form></li>
                
                <li><form action="ajouterProduit" method="post">
                  <input type="hidden" name="action" value="afficherProduit"/>
                    <input id="6" type="submit" value="Mes Produits" class="optn">
                       </form></li> 
                 
                <li><form action="ajouterProduit" method="post">
                  
                    <input type="hidden" name="action" value="location"/>
                    <input id="7" type="submit" value="Mon Location" class="optn">
                       </form></li> 
                       
                <li><form action="Deconnexion" method="post">
                    <input type="hidden" name="action" value="deconnecter"/>
                    <input type="submit" value="Déconnecter" class="deco">
                       </form>
                    <script>
                           
                                    
                                var list = document.getElementById('<%=cl.getIdPharmacie() %>'); 
                                
                                if(<%=cl.getIdPharmacie() %>!==1){
                                    
                                    document.getElementById('1').style.visibility = 'hidden';
                                    document.getElementById('2').style.visibility = 'visible';
                                    document.getElementById('3').style.visibility = 'visible';
                                    document.getElementById('4').style.visibility = 'visible';
                                    document.getElementById('5').style.visibility = 'visible';
                                    document.getElementById('6').style.visibility = 'visible';
                                    document.getElementById('7').style.visibility = 'visible';
                                }
                                else{
                                     
                                    document.getElementById('1').style.visibility = 'visible';
                                    document.getElementById('2').style.visibility = 'hidden';
                                    document.getElementById('3').style.visibility = 'hidden';
                                    document.getElementById('4').style.visibility = 'hidden';
                                     document.getElementById('5').style.visibility = 'hidden';
                                    document.getElementById('6').style.visibility = 'hidden';
                                    document.getElementById('7').style.visibility = 'hidden';
                                    
                                }
                                    
                                
                       </script>
                    
                </li>
            </ul>
                    </dive>
            </nav>
            
            
        </div>
                    <div class="l">
                        <div class="top">
                 <h1> Ajouter Produit </h1>
                 
                
        <form  action="ajouterProduit" method="POST">
            <p>REFERENCE PRODUIT</p> <input type="text" name="reference" class="txtb" required><br>
            <p>LIBELLE</p> <input type="text" name="libelle" class="txtb" required><br>
            <p>PRIX</p> <input type="text" name="prix" class="txtb" required><br>
            <p>TEMPERATURE</p> <input type="text" name="temp" class="txtb" required><br>
            <p>DATE DE FABRICATION </p><input type="date" name="datefab" class="txtb" required><br>         
            <p>DATE D'EXPIRATION</p> <input type="date" name="dateex" class="txtb" required><br>
            <input type="hidden" name="action" value="aaa"><br>
            <input type="hidden" name="idpharmacie" value="<%=idPharmacie %>" class="txtb"><br>
       
            <input type="submit" value="Ajouter" class="signup-btn">
        </form>
            
            
                </div>
                   <%
}
else
{
	//Integer i=new Integer(1);
	//request.setAttribute("i",i);
	request.getRequestDispatcher("PageClient.jsp").forward(request,response);
}
%> 
    </div>
        <div class="footer">
            <p>Copyright © 2019 IOSM.</p>
        </div>   
</body>
</html>
