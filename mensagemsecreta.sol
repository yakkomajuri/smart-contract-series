pragma solidity ^0.4.24;

contract MensagemSecreta {
    string mensagem;
    string escolhersenha;
    string senha;
    
    function enviarMensagem(string _mensagem, string _escolhersenha) public {
            require (bytes(_mensagem).length > 0 && bytes(_escolhersenha).length > 0 );
            mensagem = _mensagem;
            escolhersenha = _escolhersenha;
    }
    
    function lerMensagem (string _senha) public view returns (string) {
        require (verificarSenha(escolhersenha, _senha) == true);
        return (mensagem);
    }
    
    function verificarSenha (string storage _a, string memory _b) internal pure returns(bool) {
        bytes storage a = bytes(_a);
        bytes memory b = bytes(_b);
       
        if (keccak256(a) != keccak256(b)) {
            return false;
        }
        return true;
    }
}
