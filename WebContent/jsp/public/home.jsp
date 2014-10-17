	<%@page contentType="text/html" pageEncoding="UTF-8" import="edutechonline.servlets.SessionFilter, edutechonline.database.*"%>	
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib prefix="edutech" tagdir="/WEB-INF/tags" %>
	
	<%
		try {
			int userId=SessionFilter.getUserId(request);
			boolean loggedIn=false;
			//if the ID was valid
			if (userId>=0) {
				loggedIn=true;
				
				request.setAttribute("user", Users.getUser(userId));
			}
			request.setAttribute("loggedIn", loggedIn);
		} catch (Exception e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "error loading page");
		}
		
	
	%>
	<edutech:template title="home" css="public/home" js="">
		
	<title>Edutechonline</title>
	
		<div id="whatsNew" class="mainbox col-md-3">
			<div class="panel panel-info">
	  			<div class="panel-heading">
	 		 		<h5 class="panel-title">What's New</h5>
	  			</div>
	  				<div class="panel-body">
			<ul>
				<li>New course on Linux- Introduction to Linux</li>
				<li>New courses on Verification - Formal methods in software engineering.</li>
				<li>Trouble in finding the formula in Microsoft excel- Excel in Microsoft excel</li>
				<li>Interested in photoediting !!- Introduction to adobe photoshop</li>
				<li>Website designing - Introduction to HTML and CSS</li>
				<li>New course on Animation</li>
			
			
			</ul>
					</div>
			</div>
		</div>
		
	<div class="container">	
	<c:if test="${!loggedIn}">
	  <form method="POST" action="j_security_check">
	
			<div id="loginDiv" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 "> 
				<div class="panel panel-info">
	 				 <div class="panel-heading">
	  				<h5 class="panel-title">Login</h5>
	  			</div>
	 					 <div class="panel-body">
	
		
				
							<div style="padding-top:10px" class="panel-body" >
		
	            						<div style="margin-bottom: 25px" class="input-group">
	                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                                        <input id="login-username" type="text" class="form-control" name="uname" value="" placeholder="username or email">                                        
	                                    </div>
	                                
	                            		<div style="margin-bottom: 25px" class="input-group">
	                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                                        <input id="login-password" type="password" class="form-control" name="pass" value="" placeholder="password">
	                                    </div>
	                                    
	
	                                
	                            		<div class="input-group">
	                                      	<div class="checkbox">
	                                        	<label>
	                                          		<input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
	                                        	</label>
	                                      	</div>
	                                    </div>
	
	
	                                	<div style="margin-top:10px" class="form-group">
	                                   
	                                    	<div class="col-sm-12 controls">
	                                      		<a id="btn-login" class="btn btn-primary">Login</a>
	                                      
	                                    	</div>
	                                	</div>
	
	
	                                	<div class="form-group">
	                                    	<div class="col-md-12 control">
	                                        	<div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
	                                            			Not yet Registered! 
	                                        		<a href="/EduTechOnline/jsp/public/registration.jsp">
	                                            			Sign Up Here
	                                        		</a>
	                                       		</div>
	                                    	</div>
	                                	</div>    
	                                 
							</div>
	     			</div>                     
	 			</div> 
	 		</div>
	 	</form>
	 </c:if> 
	           
	        
	        <c:if test="${loggedIn}">
	        	<p>Hello, ${user.getFullName()}</p>
	        	<p><a onclick="javascript:logout();">logout</a></p>
	        </c:if>
	    </div>
	  
	
	</edutech:template>