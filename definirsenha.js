$("#button3").click(function(web3) {
     var tx = Hodl.definirSenha("\"" + $("#defsenha")[0].value + "\"", { 
         from: address,
         to: "0xEA7128025c3b7c8F230dfB5b7e7C3Ac45158335B",
         value: "0",
         data: ""
  }, function(err, transactionHash) {
   if (!err)
    console.log(transactionHash); 
})
})
