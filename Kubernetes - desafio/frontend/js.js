$("#button-blue").on("click", function() {
    
    var txt_nome = $("#name").val();
    var txt_email = $("#email").val();
    var txt_comentario = $("#comment").val();

    $.ajax({
        //AQUI ENTRA O IP EXTERNO DO LOAD BALANCER//
        
        url: "http://34.72.148.211",
        
        type: 'post',
        data: {nome: txt_nome, comentario: txt_comentario, email: txt_email},
        beforeSend: function() {
        
            console.log("Tentando enviar os dados....");

        }
    }).done(function(e) {
        alert("Dados Salvos em http://34.72.148.211");
    })

});