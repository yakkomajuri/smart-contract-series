pragma solidity^0.4.24;

contract owned {
    address owner;
    constructor() public {
        owner = msg.sender;
    }
    modifier onlyowner() {
        if (msg.sender == owner) {
            _;
        }
    }
}

contract HODL is owned {
    uint hoje;    
    string definirsenha;
    string senha;
    constructor() public {
        hoje = block.timestamp;
    }
    
    function depositarInvestimento() public payable onlyowner {}
    
    function definirSenha(string _definirsenha) public onlyowner {
       require(bytes(_definirsenha).length > 0);
       definirsenha = _definirsenha;
    }
    
    function retirarInvestimento(string _senha) public onlyowner { 
       require (verificarSenha(definirsenha, _senha) == true, 
       "Senha incorreta. Tente novamente."
       ); 
       require (
        block.timestamp >= hoje + 365 days, 
        "Você não queria HODL?"
       );
       owner.transfer((address(this)).balance); 
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
