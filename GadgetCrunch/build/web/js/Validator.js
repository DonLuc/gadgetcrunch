/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateID()
{
    var id_num = document.getElementById("id_number");
    var hidID = document.getElementById("hidID");
    
    if(id_num.length != 13) 
    {
        hidID.innerHTML = "Ivalid ID";
        
    }
}


