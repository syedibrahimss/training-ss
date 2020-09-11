/*

 * Custom code goes here.

 * A template should always ship with an empty custom.js

 */





function accountValidation_r(){

  var accerrors = 0;

  var accmainstring = '';

  var accvaldstrng = '';

  var lencheck = 0;

  var acount_type = document.getElementById("acount_type").value;

  $(".help-block").remove();





 $("input.form-control").removeAttr("style");

  $("select.form-control").removeAttr("style");

   //document.getElementsByName("email")[0].css("outline","none;");

   document.getElementsByName("email")[0].style.outline="none";

  if(acount_type == "4"){

    

     var fname = document.getElementsByName("firstname")[0].value;

     var lname = document.getElementsByName("lastname")[0].value;

     var bday = document.getElementsByName("birthday")[0].value;

     var country = document.getElementsByName("c_id_country")[0].value;
     var ship_country = document.getElementsByName("ship_country")[0].value;
     var bill_country = document.getElementsByName("ship_country")[0].value;
      var store = document.getElementsByName("id_store")[0].value;

     var email = document.getElementsByName("email")[0].value;

     var mob = document.getElementsByName("phone")[0].value;

   

     var add1 = document.getElementsByName("address1")[0].value;

     var add2 = document.getElementsByName("address2")[0].value;

     var suburb = document.getElementsByName("suburb")[0].value;

     var province = document.getElementsByName("province")[0].value;

     var pincode = document.getElementsByName("postcode")[0].value;

     var city = document.getElementsByName("city")[0].value;



     var billadd1 = document.getElementsByName("billaddress1")[0].value;

     var billadd2 = document.getElementsByName("billaddress2")[0].value;

     var billsuburb = document.getElementsByName("bsuburb")[0].value;

     var billprovince = document.getElementsByName("billprovince")[0].value;

     var billpincode = document.getElementsByName("billzipcode")[0].value;

     var billcity = document.getElementsByName("billcity")[0].value;

     

     

     var feedback = document.getElementsByName("feedback")[0].value;

	 var id_miro = $("input[name='id_miro']:checked").val();

	 var p_miri_account = document.getElementsByName("p_miri_account")[0].value;

	  var regName = /^[a-zA-Z ]+$/;
	  var namVal = /^[A-Za-z \'\s]+$/;

	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;

	var phonereg = /^[0-9]+$/;

	var focusdat	=0;



        

        //console.log('error');

        //var accerrors =1;

        accmainstring = accmainstring + 'Error:missing fields';

        accvaldstrng = accvaldstrng + 'Please ensure you have completed all mandatory fields marked *' +'<br>';

        

        if(fname == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Firstname' +'<br>';

		  document.getElementsByName("firstname")[0].style.border="solid 1px red";

		  $("#lastname").after('<div  class="col-md-3 help-block firstname-error" style="color:red;">Please enter firstname</div>');


		  document.getElementsByName("firstname")[0].focus();

		  focusdat	=1;

		  

        }else if((id_miro == 0) &&(fname.length < 3 || fname.length > 20)){

			accerrors = 1;

	        $("#lastname").after('<div  class="col-md-3 help-block firstname-error" style="color:red;">Min 3 and max 20 characters</div>');

        	lencheck = 1;

			if(focusdat==0){

				document.getElementsByName("firstname")[0].focus();	

				focusdat	=1;

			}

		}else if(!namVal.test(fname)){

			accerrors = 1;

			accmainstring = 'Error:The following fields should contain alphabets only';			

			$("#lastname").after('<div  class="col-md-3 help-block firstname-error" style="color:red;">Should contain alphabets only</div>'); 	

				if(focusdat==0){

					document.getElementsByName("firstname")[0].focus();	

					focusdat	=1;

				}

			}

        if(lname == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Lastname' +'<br>';

		   document.getElementsByName("lastname")[0].style.border="solid 1px red";

		  $("#lastname").after('<div  class="col-md-3 help-block lastname-error" style="color:red;">Please enter lastname</div>');

				if(focusdat==0){

					document.getElementsByName("lastname")[0].focus();	

					focusdat	=1;

				} 

        }else if((id_miro == 0) &&(lname.length < 3 || lname.length > 20)){

			  accerrors = 1;

			  $("#lastname").after('<div  class="col-md-3 help-block lastname-error" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

				if(focusdat==0){

					document.getElementsByName("lastname")[0].focus();	

					focusdat	=1;

				} 

		}else if(!namVal.test(lname)){

			accerrors = 1;

			accmainstring = 'Error:The following fields should contain alphabets only';					

			$("#lastname").after('<div  class="col-md-3 help-block lastname-error" style="color:red;">Should contain alphabets only</div>');

				if(focusdat==0){

					document.getElementsByName("lastname")[0].focus();	

					focusdat	=1;

				} 

			

		}

        

     /*   if(bday == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Birthdate' +'<br>';

		   document.getElementsByName("birthday")[0].style.border="solid 1px red";

		  $("#div_birthday").after('<div  class="col-md-3 help-block" style="color:red;">Please enter birthdate</div>');

		  				if(focusdat==0){

					document.getElementsByName("birthday")[0].focus();	

					focusdat	=1;

				} 

        }*/
        
         if(store == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'store' +'<br>';

		   document.getElementsByName("id_store")[0].style.border="solid 1px red";

		  $("#div_id_store").after('<div  class="col-md-3 help-block" style="color:red;">Please Select MiRo branch</div>');

		  				if(focusdat==0){

					document.getElementsByName("id_store")[0].focus();	

					focusdat	=1;

				} 

        }

        if(country == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Country' +'<br>';

	   document.getElementsByName("c_id_country")[0].style.border="solid 1px red";

		  $("#div_c_id_country").after('<div  class="col-md-3 help-block" style="color:red;">Please select country</div>');

		  		if(focusdat==0){

					document.getElementsByName("c_id_country")[0].focus();	

					focusdat	=1;

				} 

        }else{

			 document.getElementsByName("phone")[0].style="padding-left:10%;";

		}

        if(email == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Email' + '<br>';

		   document.getElementsByName("email")[0].style.border="solid 1px red";

		  $("#div_email").after('<div  class="col-md-3 help-block" style="color:red;">Please enter email</div>');

		  		if(focusdat==0){

					document.getElementsByName("email")[0].focus();	

					focusdat	=1;

				} 

        }else if(!mailformat.test(email))

		  {

	

			accerrors = 1;

			$("#div_email").after('<div  class="col-md-3 help-block" style="color:red;">Please include "@" and "."</div>');

		  		if(focusdat==0){

					document.getElementsByName("email")[0].focus();	

					focusdat	=1;

				} 

		  }

        if(mob == ''){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Phone' +'<br>';

		   document.getElementsByName("phone")[0].style.border="solid 1px red";

		  $("#div_phone").after('<div  class="col-md-3 help-block" style="color:red;">Please enter phone</div>');

		  		if(focusdat==0){

					document.getElementsByName("phone")[0].focus();	

					focusdat	=1;

				} 

        }else if(!mob.match(phonereg) || (mob.length != 10))

         {

     		 accerrors = 1;

		   $("#div_phone").after('<div  class="col-md-3 help-block" style="color:red;">Should be 10 digits</div>');

          accerrors = 1;

		  		if(focusdat==0){

					document.getElementsByName("phone")[0].focus();	

					focusdat	=1;

				} 

        }

		

        if((id_miro == 1) && (p_miri_account=='')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'MiRO client code' +'<br>';

		   document.getElementsByName("p_miri_account")[0].style.border="solid 1px red";

		  $("#div_id_miro").after('<div  class="col-md-3 help-block" style="color:red;padding-top: 4%;">Please enter MiRO client code</div>');

		  		if(focusdat==0){

					document.getElementsByName("p_miri_account")[0].focus();	

					focusdat	=1;

				} 

        }

        if((id_miro == 0) && (add1 == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + ' Shipping street1' +'<br>';

		   document.getElementsByName("address1")[0].style.border="solid 1px red";

		  $("#div_address1").after('<div  class="col-md-3 help-block" style="color:red;">Please enter shipping street1</div>');

		  		if(focusdat==0){

					document.getElementsByName("address1")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(add1.length < 3 || add1.length > 20)){

			  accerrors = 1;

			  $("#div_address1").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("address1")[0].focus();	

					focusdat	=1;

				}

		}

        if((id_miro == 0) && (add2 != '') &&(add2.length < 3 || add2.length > 20)){

			  accerrors = 1;

			  $("#div_address2").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("address2")[0].focus();	

					focusdat	=1;

				}

		}

        if((id_miro == 0) && suburb != '' && (suburb.length < 3 || suburb.length > 20)){

			  accerrors = 1;

			  $("#div_suburb").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("suburb")[0].focus();	

					focusdat	=1;

				}

		}

         if((id_miro == 0) && (city == '')){

			  accerrors = 1;

          accvaldstrng = accvaldstrng + 'Shipping city' +'<br>';

		   document.getElementsByName("city")[0].style.border="solid 1px red";

		  $("#div_city").after('<div  class="col-md-3 help-block" style="color:red;">Please enter shipping city</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("city")[0].focus();	

					focusdat	=1;

				}

        } else if((id_miro == 0) &&(city.length < 3 || city.length > 20)){

			  accerrors = 1;

			  $("#div_city").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("city")[0].focus();	

					focusdat	=1;

				}

		}  

        if((id_miro == 0) && (province == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Shipping province' +'<br>';

		   document.getElementsByName("province")[0].style.border="solid 1px red";

		  $("#div_province").after('<div  class="col-md-3 help-block" style="color:red;">Shipping province</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("province")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(province.length < 3 || province.length > 20)){

			  accerrors = 1;

			  $("#div_province").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("province")[0].focus();	

					focusdat	=1;

				}

		} 

        if((id_miro == 0) && (pincode == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Shipping areacode' +'<br>';

		   document.getElementsByName("postcode")[0].style.border="solid 1px red";

		  $("#div_postcode").after('<div  class="col-md-3 help-block" style="color:red;">Please enter shipping areacode</div>');

		  		if(focusdat==0){

					document.getElementsByName("postcode")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(pincode.length < 4 || pincode.length > 5)){

			  accerrors = 1;

			  $("#div_postcode").after('<div  class="col-md-3 help-block" style="color:red;">Min 4 and max 5 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("postcode")[0].focus();	

					focusdat	=1;

				}

		}
		if((id_miro == 0) && (ship_country == '')){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'ship_country' +'<br>';

	   document.getElementsByName("ship_country")[0].style.border="solid 1px red";

		  $("#div_ship_country").after('<div  class="col-md-3 help-block" style="color:red;">Please select country</div>');

		  		if(focusdat==0){

					document.getElementsByName("ship_country")[0].focus();	

					focusdat	=1;

				} 

        }

         



        if((id_miro == 0) && (billadd1 == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Billing street1' +'<br>';

		   document.getElementsByName("billaddress1")[0].style.border="solid 1px red";

		  $("#div_billaddress1").after('<div  class="col-md-3 help-block" style="color:red;">Please enter billing street1</div>');

		  		if(focusdat==0){

					document.getElementsByName("billaddress1")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(billadd1.length < 3 || billadd1.length > 20)){

			  accerrors = 1;

			  $("#div_billaddress1").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billaddress1")[0].focus();	

					focusdat	=1;

				}

		}

       if((id_miro == 0) && (billadd2 != '') &&(billadd2.length < 3 || billadd2.length > 20)){

			  accerrors = 1;

			  $("#div_billaddress2").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billaddress2")[0].focus();	

					focusdat	=1;

				}

		}

        

         if((id_miro == 0) && billsuburb != '' && (billsuburb.length < 3 || billsuburb.length > 20)){

			  accerrors = 1;

			  $("#div_bsuburb").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("bsuburb")[0].focus();	

					focusdat	=1;

				}

		}

        if((id_miro == 0) && (billcity == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Billing city' +'<br>';

		   document.getElementsByName("billcity")[0].style.border="solid 1px red";

		  $("#div_billcity").after('<div  class="col-md-3 help-block" style="color:red;">Please enter billing city</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("billcity")[0].focus();	

					focusdat	=1;

				}

        } else if((id_miro == 0) &&(billcity.length < 3 || billcity.length > 20)){

			  accerrors = 1;

			  $("#div_billcity").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billcity")[0].focus();	

					focusdat	=1;

				}

		}

        if((id_miro == 0) && (billprovince == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Billing province' +'<br>';

		   document.getElementsByName("billprovince")[0].style.border="solid 1px red";

		  $("#div_billprovince").after('<div  class="col-md-3 help-block" style="color:red;">Please enter billing province</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("billprovince")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(billprovince.length < 3 || billprovince.length > 20)){

			  accerrors = 1;

			  $("#div_billprovince").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billprovince")[0].focus();	

					focusdat	=1;

				}

		}

        if((id_miro == 0) && (billpincode == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Billing areacode' +'<br>';

		   document.getElementsByName("billzipcode")[0].style.border="solid 1px red";

		  $("#div_billzipcode").after('<div  class="col-md-3 help-block" style="color:red;">Please enter billing areacode</div>');  

		  		if(focusdat==0){

					document.getElementsByName("billzipcode")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(billpincode.length < 4 || billpincode.length > 5)){

			  accerrors = 1;

			  $("#div_billzipcode").after('<div  class="col-md-3 help-block" style="color:red;">Min 4 and max 5 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billzipcode")[0].focus();	

					focusdat	=1;

				}

		}
		
		if((id_miro == 0) && (bill_country == '')){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'bill_country' +'<br>';

	   document.getElementsByName("bill_country")[0].style.border="solid 1px red";

		  $("#div_bill_country").after('<div  class="col-md-3 help-block" style="color:red;">Please select country</div>');

		  		if(focusdat==0){

					document.getElementsByName("bill_country")[0].focus();	

					focusdat	=1;

				} 

        }
        if(document.getElementsByName("psgdpr")[0].checked==false){

			 accerrors = 1;

           accvaldstrng = accvaldstrng + 'Terms & conditions' +'<br>'; 

		   document.getElementsByName("psgdpr")[0].style.border="solid 1px red";

		  $("#div_newsletter").after('<div  class="col-md-3 help-block" style="color:red;">Please acknowledge  terms & conditions</div>');   

        }

		

		if(feedback != '' && (feedback.length < 3 || feedback.length > 20)){

			

			accerrors = 1;

			$("#div_feedback").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("feedback")[0].focus();	

					focusdat	=1;

				}

    	 }else  if(feedback != '' &&(!regName.test(feedback) || !regName.test(feedback))){

				

					$("#div_feedback").after('<div  class="col-md-3 help-block" style="color:red;">Should contain alphabets and space only</div>');

					accerrors = 1;

					lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("feedback")[0].focus();	

					focusdat	=1;

				}

				  }

            

   

    

  }

  if(acount_type == "5"){

    

     var fname = document.getElementsByName("firstname")[0].value;

     var lname = document.getElementsByName("lastname")[0].value;
     var job_title = document.getElementsByName("job_title")[0].value;

     var bday = document.getElementsByName("birthday")[0].value;

     var country = document.getElementsByName("c_id_country")[0].value;

     var email = document.getElementsByName("email")[0].value;

     var mob = document.getElementsByName("phone")[0].value;

   

    

    

     

     

     var feedback = document.getElementsByName("feedback")[0].value;

	 var id_miro = $("input[name='id_miro']:checked").val();

	 var p_miri_account = document.getElementsByName("p_miri_account")[0].value;

	 var regName = /^[a-zA-Z ]+$/;
	 var namVal = /^[A-Za-z \'\s]+$/;

	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;

	var phonereg = /^[0-9]+$/;

	var focusdat	=0;



        

        //console.log('error');

        //var accerrors =1;

        accmainstring = accmainstring + 'Error:missing fields';

        accvaldstrng = accvaldstrng + 'Please ensure you have completed all mandatory fields marked *' +'<br>';

        

        if(fname == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Firstname' +'<br>';

		  document.getElementsByName("firstname")[0].style.border="solid 1px red";

		  $("#lastname").after('<div  class="col-md-3 help-block firstname-error" style="color:red;">Please enter firstname</div>');

		  document.getElementsByName("firstname")[0].focus();

		  focusdat	=1;

		  

        }else if((id_miro == 1) &&(fname.length < 3 || fname.length > 20)){

			accerrors = 1;

		$("#lastname").after('<div  class="col-md-3 help-block firstname-error" style="color:red;">Min 3 and max 20 characters</div>');

        	lencheck = 1;

			if(focusdat==0){

				document.getElementsByName("firstname")[0].focus();	

				focusdat	=1;

			}

		}else if(!namVal.test(fname)){

			accerrors = 1;

			accmainstring = 'Error:the following fields should contain alphabets only';			

			$("#lastname").after('<div  class="col-md-3 help-block firstname-error" style="color:red;">Should contain alphabets only</div>'); 	

				if(focusdat==0){

					document.getElementsByName("firstname")[0].focus();	

					focusdat	=1;

				}

			}

        if(lname == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Lastname' +'<br>';

		   document.getElementsByName("lastname")[0].style.border="solid 1px red";

		  $("#lastname").after('<div  class="col-md-3 help-block lastname-error" style="color:red;">Please enter lastname</div>');

				if(focusdat==0){

					document.getElementsByName("lastname")[0].focus();	

					focusdat	=1;

				} 

        }else if((id_miro == 1) &&(lname.length < 3 || lname.length > 20)){

			  accerrors = 1;

			  $("#lastname").after('<div  class="col-md-3 help-block lastname-error" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

				if(focusdat==0){

					document.getElementsByName("lastname")[0].focus();	

					focusdat	=1;

				} 

		}else if(!namVal.test(lname)){

			accerrors = 1;

			accmainstring = 'Error:the following fields should contain alphabets only';					

			$("#lastname").after('<div  class="col-md-3 help-block lastname-error" style="color:red;">should contain alphabets only</div>');

				if(focusdat==0){

					document.getElementsByName("lastname")[0].focus();	

					focusdat	=1;

				} 

			

		}

        if(job_title == ''){

		    accerrors = 1;

          accvaldstrng = accvaldstrng + 'Job title' +'<br>';

		   document.getElementsByName("job_title")[0].style.border="solid 1px red";

		  $("#div_job_title").after('<div  class="col-md-3 help-block" style="color:red;">Please enter office job title</div>');

				if(focusdat==0){

					document.getElementsByName("job_title")[0].focus();	

					focusdat	=1;

				}

        }else if(job_title.length < 2 || job_title.length > 50){

   				 accerrors = 1;

			  $("#div_job_title").after('<div  class="col-md-3 help-block" style="color:red;">Min 2 and max 50 characters</div>');

       	

        	lencheck = 1;;

				if(focusdat==0){

					document.getElementsByName("job_title")[0].focus();	

					focusdat	=1;

				}

     }

       

        if(country == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Country' +'<br>';

	   document.getElementsByName("c_id_country")[0].style.border="solid 1px red";

		  $("#div_c_id_country").after('<div  class="col-md-3 help-block" style="color:red;">Please select country</div>');

		  		if(focusdat==0){

					document.getElementsByName("c_id_country")[0].focus();	

					focusdat	=1;

				} 

        }else{

			 document.getElementsByName("phone")[0].style="padding-left:10%;";

		}

        if(email == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Email' + '<br>';

		   document.getElementsByName("email")[0].style.border="solid 1px red";

		  $("#div_email").after('<div  class="col-md-3 help-block" style="color:red;">Please enter email</div>');

		  		if(focusdat==0){

					document.getElementsByName("email")[0].focus();	

					focusdat	=1;

				} 

        }else if(!mailformat.test(email))

		  {

	

			accerrors = 1;

			$("#div_email").after('<div  class="col-md-3 help-block" style="color:red;">Please include "@" and "."</div>');

		  		if(focusdat==0){

					document.getElementsByName("email")[0].focus();	

					focusdat	=1;

				} 

		  }

        if(mob == ''){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Phone' +'<br>';

		   document.getElementsByName("phone")[0].style.border="solid 1px red";

		  $("#div_phone").after('<div  class="col-md-3 help-block" style="color:red;">Please enter phone</div>');

		  		if(focusdat==0){

					document.getElementsByName("phone")[0].focus();	

					focusdat	=1;

				} 

        }else if(!mob.match(phonereg) || (mob.length != 10))

         {

     		 accerrors = 1;

		   $("#div_phone").after('<div  class="col-md-3 help-block" style="color:red;">Should be 10 digits</div>');

          accerrors = 1;

		  		if(focusdat==0){

					document.getElementsByName("phone")[0].focus();	

					focusdat	=1;

				} 

        }

		

        if((id_miro == 1) && (p_miri_account=='')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'MiRO client code' +'<br>';

		   document.getElementsByName("p_miri_account")[0].style.border="solid 1px red";

		  $("#div_id_miro").after('<div  class="col-md-3 help-block" style="color:red;padding-top: 4%;">Please enter MiRO client code</div>');

		  		if(focusdat==0){

					document.getElementsByName("p_miri_account")[0].focus();	

					focusdat	=1;

				} 

        }

        

        if(document.getElementsByName("psgdpr")[0].checked==false){

			 accerrors = 1;

           accvaldstrng = accvaldstrng + 'Terms & conditions' +'<br>'; 

		   document.getElementsByName("psgdpr")[0].style.border="solid 1px red";

		  $("#div_newsletter").after('<div  class="col-md-3 help-block" style="color:red;">Please acknowledge  terms & conditions</div>');   

        }

		

		if(feedback != '' && (feedback.length < 3 || feedback.length > 20)){

			

			accerrors = 1;

			$("#div_feedback").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("feedback")[0].focus();	

					focusdat	=1;

				}

    	 }else  if(feedback != '' &&(!regName.test(feedback) || !regName.test(feedback))){

				

					$("#div_feedback").after('<div  class="col-md-3 help-block" style="color:red;">should contain alphabets and space only</div>');

					accerrors = 1;

					lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("feedback")[0].focus();	

					focusdat	=1;

				}

				  }

            

   

    

  }

  if(acount_type == "3"){

      //alert('gggg');

     var company = document.getElementsByName("company")[0].value; 

     var country = document.getElementsByName("c_id_country")[0].value;

     var fname = document.getElementsByName("firstname")[0].value;

     var lname = document.getElementsByName("lastname")[0].value;

     var job_title = document.getElementsByName("job_title")[0].value;

     var tradecompany = document.getElementsByName("trade_company_name")[0].value;

     var naturebusiness = document.getElementsByName("nature_company")[0].value;

     var comreg = document.getElementsByName("siret")[0].value;

     var bday = document.getElementsByName("company_birthday")[0].value;

     var ship_country = document.getElementsByName("ship_country")[0].value;
     var bill_country = document.getElementsByName("ship_country")[0].value;

     var email = document.getElementsByName("email")[0].value;

     var mob = document.getElementsByName("phone")[0].value;

  

    
    var store = document.getElementsByName("id_store")[0].value;
    var website = document.getElementsByName("website")[0].value;
     var add1 = document.getElementsByName("address1")[0].value;

     var add2 = document.getElementsByName("address2")[0].value;

     var suburb = document.getElementsByName("suburb")[0].value;

     var province = document.getElementsByName("province")[0].value;

     var pincode = document.getElementsByName("postcode")[0].value;

     var city = document.getElementsByName("city")[0].value;



     var billadd1 = document.getElementsByName("billaddress1")[0].value;

     var billadd2 = document.getElementsByName("billaddress2")[0].value;

     var billsuburb = document.getElementsByName("bsuburb")[0].value;

     var billprovince = document.getElementsByName("billprovince")[0].value;

     var billpincode = document.getElementsByName("billzipcode")[0].value;

     var billcity = document.getElementsByName("billcity")[0].value;

     var bus_add1 = document.getElementsByName("bus_address1")[0].value;

     var bus_add2 = document.getElementsByName("bus_address2")[0].value;

     var bus_suburb = document.getElementsByName("bus_suburb")[0].value;

     var bus_province = document.getElementsByName("bus_province")[0].value;

     var bus_pincode = document.getElementsByName("bus_postcode")[0].value;

     var bus_city = document.getElementsByName("bus_city")[0].value;

     var companyphone1 = document.getElementsByName("company_phone1")[0].value;

     var companyphone2 = document.getElementsByName("company_phone2")[0].value;

     var feedback = document.getElementsByName("feedback")[0].value;

	 var regName = /^[a-zA-Z ]+$/;
	 var namVal = /^[A-Za-z \'\s]+$/;

	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,15})+$/;

	var phonereg = /^[0-9]+$/;
	var websitereg = /(www).(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;


	var id_miro = 0;

	var focusdat	=0;


     
        

        //console.log('error');

        //var accerrors =1;

        accmainstring = accmainstring + 'Error:missing fields';

        accvaldstrng = accvaldstrng + 'Please ensure you have completed all mandatory fields marked *' +'<br>';

		

		if(company == ''){

          accvaldstrng = accvaldstrng + 'Registered business name' +'<br>';

		  accerrors = 1;          

		   document.getElementsByName("company")[0].style.border="solid 1px red";

		  $("#div_company").after('<div  class="col-md-3 help-block" style="color:red;">Please enter business name</div>');

		   document.getElementsByName("company")[0].focus();

		  focusdat	=1;

        }

		 //alert(accerrors);

       

		 if(comreg == ''){

			  accerrors = 1;

          accvaldstrng = accvaldstrng + 'Company registration number' +'<br>';

		  	accerrors = 1;          

		   document.getElementsByName("siret")[0].style.border="solid 1px red";

		  $("#div_siret").after('<div  class="col-md-3 help-block" style="color:red;">Please enter company registration number</div>');

				if(focusdat==0){

					document.getElementsByName("siret")[0].focus();	

					focusdat	=1;

				}

        }else if(comreg.length < 3 || comreg.length > 20){

   				 accerrors = 1;

			  $("#div_siret").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;;

				if(focusdat==0){

					document.getElementsByName("siret")[0].focus();	

					focusdat	=1;

				}

     	}

        if(naturebusiness == ''){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Nature of business' +'<br>';

		   accerrors = 1;          

		   document.getElementsByName("nature_company")[0].style.border="solid 1px red";

		  $("#div_nature_company").after('<div  class="col-md-3 help-block" style="color:red;">Please enter nature of business</div>');

				if(focusdat==0){

					document.getElementsByName("nature_company")[0].focus();	

					focusdat	=1;

				}

        }
        
        if(website != ''){
            if (websitereg.test(website)) {
                        //alert("Url is valid");
                        //return true;
             }else{
                  accerrors = 1;
                 $("#div_website").after('<div  class="col-md-3 help-block" style="color:red;">Please enter valid website URL (www.example.com)</div>');

		  		if(focusdat==0){

					document.getElementsByName("website")[0].focus();	

					focusdat	=1;

				}
             } 
            
        }
    if(store == ''){
    
    			accerrors = 1;
    
              accvaldstrng = accvaldstrng + 'store' +'<br>';
    
    		   document.getElementsByName("id_store")[0].style.border="solid 1px red";
    
    		  $("#div_id_store").after('<div  class="col-md-3 help-block" style="color:red;">Please Select MiRo branch</div>');
    
    		  				if(focusdat==0){
    
    					document.getElementsByName("id_store")[0].focus();	
    
    					focusdat	=1;
    
    				} 
    
            }
		 if(country == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Country' +'<br>';

	   document.getElementsByName("c_id_country")[0].style.border="solid 1px red";

		  $("#div_c_id_country").after('<div  class="col-md-3 help-block" style="color:red;">Please select country</div>');

		  		if(focusdat==0){

					document.getElementsByName("c_id_country")[0].focus();	

					focusdat	=1;

				} 

        }else{

			 document.getElementsByName("phone")[0].style="padding-left:10%;";

			 document.getElementsByName("company_phone1")[0].style="padding-left:10%;";

			 document.getElementsByName("company_phone2")[0].style="padding-left:10%;";

		}

       

        /*if(bday == ''){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Company birthdate' +'<br>';

		  	accerrors = 1;          

		   document.getElementsByName("company_birthday")[0].style.border="solid 1px red";

		  $("#div_company_birthday").after('<div  class="col-md-3 help-block" style="color:red;">Please Select Company birthdate</div>');

				if(focusdat==0){

					document.getElementsByName("company_birthday")[0].focus();	

					focusdat	=1;

				}

        }*/

       

        if((id_miro == 0) && (bus_add1 == '')){

			 accerrors = 1;

			 //alert('ffff');

          accvaldstrng = accvaldstrng + ' Business street1' +'<br>';

		   document.getElementsByName("bus_address1")[0].style.border="solid 1px red";

		  $("#div_bus_address1").after('<div  class="col-md-3 help-block" style="color:red;">Please enter street1</div>');

		  		if(focusdat==0){

					document.getElementsByName("bus_address1")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(bus_add1.length < 3 || bus_add1.length > 20)){

            

           // alert('bbbb');

			  accerrors = 1;

			  $("#div_bus_address1").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("bus_address1")[0].focus();	

					focusdat	=1;

				}

		}

		

        if((id_miro == 0) && (bus_add2 != '') &&(bus_add2.length < 3 || bus_add2.length > 20)){

			  accerrors = 1;

			  $("#div_bus_address2").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("bus_address2")[0].focus();	

					focusdat	=1;

				}

		}

       if((id_miro == 0) && bus_suburb != '' && (bus_suburb.length < 3 || bus_suburb.length > 20)){

			  accerrors = 1;

			  $("#div_bus_suburb").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("bus_suburb")[0].focus();	

					focusdat	=1;

				}

		}

         if((id_miro == 0) && (bus_city == '')){

			  accerrors = 1;

          accvaldstrng = accvaldstrng + 'Business bus_city' +'<br>';

		   document.getElementsByName("bus_city")[0].style.border="solid 1px red";

		  $("#div_bus_city").after('<div  class="col-md-3 help-block" style="color:red;">Please enter city</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("bus_city")[0].focus();	

					focusdat	=1;

				}

        } else if((id_miro == 0) &&(bus_city.length < 3 || bus_city.length > 20)){

			  accerrors = 1;

			  $("#div_bus_city").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("bus_city")[0].focus();	

					focusdat	=1;

				}

		}  

        if((id_miro == 0) && (bus_province == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Business bus_province' +'<br>';

		   document.getElementsByName("bus_province")[0].style.border="solid 1px red";

		  $("#div_bus_province").after('<div  class="col-md-3 help-block" style="color:red;">Please enter province</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("bus_province")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(bus_province.length < 3 || bus_province.length > 20)){

			  accerrors = 1;

			  $("#div_bus_province").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("bus_province")[0].focus();	

					focusdat	=1;

				}

		} 

        if((id_miro == 0) && (bus_pincode == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Business areacode' +'<br>';

		   document.getElementsByName("bus_postcode")[0].style.border="solid 1px red";

		  $("#div_bus_postcode").after('<div  class="col-md-3 help-block" style="color:red;">Please enter areacode</div>');

		  		if(focusdat==0){

					document.getElementsByName("bus_postcode")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(bus_pincode.length < 4 || bus_pincode.length > 5)){

			  accerrors = 1;

			  $("#div_bus_postcode").after('<div  class="col-md-3 help-block" style="color:red;">Min 4 and max 5 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("bus_postcode")[0].focus();	

					focusdat	=1;

				}

		}
        


        if(companyphone1 == ''){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Office phone number (or cellular)#1' +'<br>';

		  accerrors = 1;          

		   document.getElementsByName("company_phone1")[0].style.border="solid 1px red";

		  $("#div_company_phone1").after('<div  class="col-md-3 help-block" style="color:red;">Please enter office phone number</div>');

				if(focusdat==0){

					document.getElementsByName("company_phone1")[0].focus();	

					focusdat	=1;

				}

        }else if(!companyphone1.match(phonereg) || (companyphone1.length != 10))

         {

     		 accerrors = 1;

		   $("#div_company_phone1").after('<div  class="col-md-3 help-block" style="color:red;">Should be 10 digits</div>');

          accerrors = 1;

		  		if(focusdat==0){

					document.getElementsByName("company_phone1")[0].focus();

					focusdat	=1;

				} 

        }
        
       if(companyphone2 == ''){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Office phone number (or cellular)#2' +'<br>';

		  accerrors = 1;          

		   document.getElementsByName("company_phone2")[0].style.border="solid 1px red";

		  $("#div_company_phone2").after('<div  class="col-md-3 help-block" style="color:red;">Please enter office phone number</div>');

				if(focusdat==0){

					document.getElementsByName("company_phone2")[0].focus();	

					focusdat	=1;

				}

        }else if(companyphone2 != '' && (!companyphone2.match(phonereg) || (companyphone2.length != 10)))

        {

     		 accerrors = 1;

		   $("#div_company_phone2").after('<div  class="col-md-3 help-block" style="color:red;">Should be 10 digits</div>');

          accerrors = 1;

		  		if(focusdat==0){

					document.getElementsByName("company_phone2")[0].focus();

					focusdat	=1;

				} 

        }

		

        

        

      

        if((id_miro == 0) && (add1 == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + ' Shipping street1' +'<br>';

		   document.getElementsByName("address1")[0].style.border="solid 1px red";

		  $("#div_address1").after('<div  class="col-md-3 help-block" style="color:red;">Please enter shipping street1</div>');

		  		if(focusdat==0){

					document.getElementsByName("address1")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(add1.length < 3 || add1.length > 20)){

			  accerrors = 1;

			  $("#div_address1").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("address1")[0].focus();	

					focusdat	=1;

				}

		}

		

        if((id_miro == 0)  && (add2 != '') &&(add2.length < 3 || add2.length > 20)){

			  accerrors = 1;

			  $("#div_address2").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("address2")[0].focus();	

					focusdat	=1;

				}

		}

       if((id_miro == 0) && suburb != '' && (suburb.length < 3 || suburb.length > 20)){

			  accerrors = 1;

			  $("#div_suburb").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("suburb")[0].focus();	

					focusdat	=1;

				}

		}

         if((id_miro == 0) && (city == '')){

			  accerrors = 1;

          accvaldstrng = accvaldstrng + 'Shipping city' +'<br>';

		   document.getElementsByName("city")[0].style.border="solid 1px red";

		  $("#div_city").after('<div  class="col-md-3 help-block" style="color:red;">Please enter shipping city</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("city")[0].focus();	

					focusdat	=1;

				}

        } else if((id_miro == 0) &&(city.length < 3 || city.length > 20)){

			  accerrors = 1;

			  $("#div_city").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("city")[0].focus();	

					focusdat	=1;

				}

		}  

        if((id_miro == 0) && (province == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Shipping province' +'<br>';

		   document.getElementsByName("province")[0].style.border="solid 1px red";

		  $("#div_province").after('<div  class="col-md-3 help-block" style="color:red;">Shipping province</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("province")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(province.length < 3 || province.length > 20)){

			  accerrors = 1;

			  $("#div_province").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("province")[0].focus();	

					focusdat	=1;

				}

		} 

        if((id_miro == 0) && (pincode == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Shipping areacode' +'<br>';

		   document.getElementsByName("postcode")[0].style.border="solid 1px red";

		  $("#div_postcode").after('<div  class="col-md-3 help-block" style="color:red;">Please enter shipping areacode</div>');

		  		if(focusdat==0){

					document.getElementsByName("postcode")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(pincode.length < 4 || pincode.length > 5)){

			  accerrors = 1;

			  $("#div_postcode").after('<div  class="col-md-3 help-block" style="color:red;">Min 4 and max 5 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("postcode")[0].focus();	

					focusdat	=1;

				}

		}

         
        if((id_miro == 0) && (ship_country == '')){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'ship_country' +'<br>';

	   document.getElementsByName("ship_country")[0].style.border="solid 1px red";

		  $("#div_ship_country").after('<div  class="col-md-3 help-block" style="color:red;">Please select country</div>');

		  		if(focusdat==0){

					document.getElementsByName("ship_country")[0].focus();	

					focusdat	=1;

				} 

        }


        if((id_miro == 0) && (billadd1 == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Billing street1' +'<br>';

		   document.getElementsByName("billaddress1")[0].style.border="solid 1px red";

		  $("#div_billaddress1").after('<div  class="col-md-3 help-block" style="color:red;">Please enter billing street1</div>');

		  		if(focusdat==0){

					document.getElementsByName("billaddress1")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(billadd1.length < 3 || billadd1.length > 20)){

			  accerrors = 1;

			  $("#div_billaddress1").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billaddress1")[0].focus();	

					focusdat	=1;

				}

		}

        if((id_miro == 0) && (billadd2 != '') &&(billadd2.length < 3 || billadd2.length > 20)){

			  accerrors = 1;

			  $("#div_billaddress2").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billaddress2")[0].focus();	

					focusdat	=1;

				}

		}

        

    if((id_miro == 0) && billsuburb != '' && (billsuburb.length < 3 || billsuburb.length > 20)){

			  accerrors = 1;

			  $("#div_bsuburb").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("bsuburb")[0].focus();	

					focusdat	=1;

				}

		}

        if((id_miro == 0) && (billcity == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Billing city' +'<br>';

		   document.getElementsByName("billcity")[0].style.border="solid 1px red";

		  $("#div_billcity").after('<div  class="col-md-3 help-block" style="color:red;">Please enter billing city</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("billcity")[0].focus();	

					focusdat	=1;

				}

        } else if((id_miro == 0) &&(billcity.length < 3 || billcity.length > 20)){

			  accerrors = 1;

			  $("#div_billcity").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billcity")[0].focus();	

					focusdat	=1;

				}

		}

        if((id_miro == 0) && (billprovince == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Billing province' +'<br>';

		   document.getElementsByName("billprovince")[0].style.border="solid 1px red";

		  $("#div_billprovince").after('<div  class="col-md-3 help-block" style="color:red;">Please enter billing province</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("billprovince")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(billprovince.length < 3 || billprovince.length > 20)){

			  accerrors = 1;

			  $("#div_billprovince").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billprovince")[0].focus();	

					focusdat	=1;

				}

		}

        if((id_miro == 0) && (billpincode == '')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Billing areacode' +'<br>';

		   document.getElementsByName("billzipcode")[0].style.border="solid 1px red";

		  $("#div_billzipcode").after('<div  class="col-md-3 help-block" style="color:red;">Please enter billing areacode</div>');  

		  		if(focusdat==0){

					document.getElementsByName("billzipcode")[0].focus();	

					focusdat	=1;

				}

        }else if((id_miro == 0) &&(billpincode.length < 4 || billpincode.length > 5)){

			  accerrors = 1;

			  $("#div_billzipcode").after('<div  class="col-md-3 help-block" style="color:red;">Min 4 and max 5 characters</div>');

       	

        	lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("billzipcode")[0].focus();	

					focusdat	=1;

				}

		}
		
		if((id_miro == 0) && (bill_country == '')){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'bill_country' +'<br>';

	   document.getElementsByName("bill_country")[0].style.border="solid 1px red";

		  $("#div_bill_country").after('<div  class="col-md-3 help-block" style="color:red;">Please select country</div>');

		  		if(focusdat==0){

					document.getElementsByName("bill_country")[0].focus();	

					focusdat	=1;

				} 

        }

		  if(fname == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Firstname' +'<br>';

		  document.getElementsByName("firstname")[0].style.border="solid 1px red";

		  $("#lastname").after('<div  class="col-md-3 help-block firstname-error" style="color:red;">Please enter firstname</div>');

		  if(focusdat==0){

					document.getElementsByName("firstname")[0].focus();	

					focusdat	=1;

				}

		  

        }else if((id_miro == 0) &&(fname.length < 3 || fname.length > 20)){

			accerrors = 1;

		$("#lastname").after('<div  class="col-md-3 help-block firstname-error" style="color:red;">Min 3 and max 20 characters</div>');

        	lencheck = 1;

			if(focusdat==0){

				document.getElementsByName("firstname")[0].focus();	

				focusdat	=1;

			}

		}else if(!namVal.test(fname)){

			accerrors = 1;

			accmainstring = 'Error:the following fields should contain alphabets only';			

			$("#lastname").after('<div  class="col-md-3 help-block firstname-error" style="color:red;">Should contain alphabets only</div>');	

				if(focusdat==0){

					document.getElementsByName("firstname")[0].focus();	

					focusdat	=1;

				}

			}

        if(lname == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Lastname' +'<br>';

		   document.getElementsByName("lastname")[0].style.border="solid 1px red";

		  $("#lastname").after('<div  class="col-md-3 help-block lastname-error" style="color:red;">Please enter lastname</div>');

				if(focusdat==0){

					document.getElementsByName("lastname")[0].focus();	

					focusdat	=1;

				} 

        }else if((id_miro == 0) &&(lname.length < 3 || lname.length > 20)){

			  accerrors = 1;

			  $("#lastname").after('<div  class="col-md-3 help-block lastname-error" style="color:red;">Min 3 and max 20 characters</div>');

       	

        	lencheck = 1;

				if(focusdat==0){

					document.getElementsByName("lastname")[0].focus();	

					focusdat	=1;

				} 

		}else if(!namVal.test(lname)){

			accerrors = 1;

			accmainstring = 'Error:The following fields should contain alphabets only';					

			$("#lastname").after('<div  class="col-md-3 help-block lastname-error" style="color:red;">Should contain alphabets only</div>');

				if(focusdat==0){

					document.getElementsByName("lastname")[0].focus();	

					focusdat	=1;

				} 

			

		}

        

       if(job_title == ''){

		    accerrors = 1;

          accvaldstrng = accvaldstrng + 'Job title' +'<br>';

		   document.getElementsByName("job_title")[0].style.border="solid 1px red";

		  $("#div_job_title").after('<div  class="col-md-3 help-block" style="color:red;">Please enter office job title</div>');

				if(focusdat==0){

					document.getElementsByName("job_title")[0].focus();	

					focusdat	=1;

				}

        }else if(job_title.length < 2 || job_title.length > 50){

   				 accerrors = 1;

			  $("#div_job_title").after('<div  class="col-md-3 help-block" style="color:red;">Min 2 and max 50 characters</div>');

       	

        	lencheck = 1;;

				if(focusdat==0){

					document.getElementsByName("job_title")[0].focus();	

					focusdat	=1;

				}

     }

       

        if(email == ''){

			accerrors = 1;

          accvaldstrng = accvaldstrng + 'Email' + '<br>';

		   document.getElementsByName("email")[0].style.border="solid 1px red";

		  $("#div_email").after('<div  class="col-md-3 help-block" style="color:red;">Please enter email</div>');

		  		if(focusdat==0){

					document.getElementsByName("email")[0].focus();	

					focusdat	=1;

				} 

        }else if(!mailformat.test(email))

		  {

	

			accerrors = 1;

			$("#div_email").after('<div  class="col-md-3 help-block" style="color:red;">Please include "@" and "."</div>');

		  		if(focusdat==0){

					document.getElementsByName("email")[0].focus();	

					focusdat	=1;

				} 

		  }

        if(mob == ''){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'Phone' +'<br>';

		   document.getElementsByName("phone")[0].style.border="solid 1px red";

		  $("#div_phone").after('<div  class="col-md-3 help-block" style="color:red;">Please enter phone</div>');

		  		if(focusdat==0){

					document.getElementsByName("phone")[0].focus();	

					focusdat	=1;

				} 

        }else if(!mob.match(phonereg) || (mob.length != 10))

         {

     		 accerrors = 1;

		   $("#div_phone").after('<div  class="col-md-3 help-block" style="color:red;">Should be 10 digits</div>');

          accerrors = 1;

		  		if(focusdat==0){

					document.getElementsByName("phone")[0].focus();	

					focusdat	=1;

				} 

        }

		

        if((id_miro == 1) && (p_miri_account=='')){

			 accerrors = 1;

          accvaldstrng = accvaldstrng + 'MiRO clientcode' +'<br>';

		   document.getElementsByName("p_miri_account")[0].style.border="solid 1px red";

		  $("#div_id_miro").after('<div  class="col-md-3 help-block" style="color:red;padding-top: 4%;">Please enter MiRO clientcode</div>');

		  		if(focusdat==0){

					document.getElementsByName("p_miri_account")[0].focus();	

					focusdat	=1;

				} 

        }

        if(document.getElementsByName("psgdpr")[0].checked==false){

			 accerrors = 1;

           accvaldstrng = accvaldstrng + 'terms & co/nditions' +'<br>'; 

		   document.getElementsByName("psgdpr")[0].style.border="solid 1px red";

		  $("#div_newsletter").after('<div  class="col-md-3 help-block" style="color:red;">Please acknowledge  terms & conditions</div>');   

        }

		

		if(feedback != '' && (feedback.length < 3 || feedback.length > 20)){

			

			accerrors = 1;

			$("#div_feedback").after('<div  class="col-md-3 help-block" style="color:red;">Min 3 and max 20 characters</div>'); 

		  		if(focusdat==0){

					document.getElementsByName("feedback")[0].focus();	

					focusdat	=1;

				}

    	 }else  if(feedback != '' &&(!regName.test(feedback) || !regName.test(feedback))){

				

					$("#div_feedback").after('<div  class="col-md-3 help-block" style="color:red;">Should contain alphabets and space only</div>');

					accerrors = 1;

					lencheck = 1;

		  		if(focusdat==0){

					document.getElementsByName("feedback")[0].focus();	

					focusdat	=1;

				}

				  }

            

   

    

  }

 //console.log(accerrors);

 // console.log('ddd');

  if(accerrors == 1){

//alert('no');

      return false;

    }

    else{

//alert('yes');

         return true;

        

    }

  

 }









 

