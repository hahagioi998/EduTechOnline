<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="edutech" tagdir="/WEB-INF/tags" %>


<edutech:template css="public/home" js="public/registration">


<form role="form" method="post" action="/EduTechOnline/public/registration" id="registerForm" class="form-horizontal">
	<div class="container">
		<div class="row"><legend>Please Enter The Below Fields</legend></div>
				<div class="col-lg-8">
			 	
					<div class="formgroup"> 
						<div class="col-md-30">
							<label for="fname" class="col-md-5">Enter First Name	</label>
				
							<input type="text"  name="fname" id="inputfirstname" class="formcontrol" placeholder="Enter First Name" required>
						</div>
										
						<div class="col-md-30">
							<label for="lname" class="col-md-5">Enter Last Name</label>
				
							<input type="text"  name="lname" id="inputlastname" class="formcontrol" placeholder="Enter Last Name" required>
						</div>
				
					
						<div class="col-md-30">
							<label for="Email" class="col-md-5">Enter Email</label>
				
							<input type="email"  name="email" id="inputfirstemail" class="formcontrol" placeholder="Enter Email" required>
						</div>	
				
					
						<div class="col-md-30">
							<label for="Confemail" class="col-md-5">Confirm Email </label>
				
							<input type="email"  name="cemail" id="confemail" class="formcontrol" placeholder="Confirm Email" required>
                		</div>
            
            
            			<div class="col-md-30">
							<label for="Password"class="col-md-5">Enter Password</label>
				
							<input type="password" name="pass" id="pass" class="formcontrol" placeholder="Enter password" required>
						</div>	
				
					
						<div class="col-md-30">
							<label for="Confpwd"class="col-md-5">Confirm Password </label>
				
							<input type="password" name="password" id="inputsecondpass" class="formcontrol" placeholder="Confirm Password" required>
            			</div>
            
            			<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info pull-left">
             	</div>
            </div>
       </div>
    </form>
          
        
                
           
</edutech:template>