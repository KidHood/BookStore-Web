/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
	function checkPassword(){
			 password = document.getElementById("password").value;
			 confirmpwd = document.getElementById("comfirmPwd").value;
			if(password != confirmpwd){
				document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
				return false;
			}else{
				document.getElementById("msg").innerHTML = "";
			}
	}

        
	function checkAgreeTerms(){
		agreeTerms = document.getElementById("agreeTerms");
                const btnTerm = document.querySelector("#submit");
		if(agreeTerms.checked == true)
			btnTerm.classList.remove('disabled');
		else{
			btnTerm.classList.add('disabled');
		}
			
	}
        
       
        var inputItems = document.querySelectorAll('.input-change').forEach((el =>{
            el.oninput = (e) => {
                if(e.target.value != ''){
                    e.target.classList.add('active');
                } else {
                    e.target.classList.remove('active');
                }
            }
                
        }))
        

