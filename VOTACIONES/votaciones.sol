//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.4 <0.9.0;
pragma experimental ABIEncoderV2;

//      Datos de prueba
// --------------------------
// Candidato| Edad  |   ID
// --------------------------
//   Toni   |  20   | 12345X
//  Alberto |  23   | 54321T
//   Joan   |  21   | 98765P
//  Javier  |  19   | 567892

contract votacion {

    struct Candidato {
        string id;
        string nombre;
        uint edad;
        bytes32 hash_datos; //hash de la edad, nombre e id del candidato
    }

    address public owner; // owner del contrato
    mapping(string => Candidato) public candidatos; // mapping de candidatos que usa como key el nombre de los candidatos
    mapping(string => uint) public votos_candidato; // mapping de los votos de cada candidato
    mapping(bytes32 => string) votantes; // mapping de los nombres de los votantes que usa como key el hash(id)
    string[] public nombres_candidatos; // lista con los nombres de los candidatos

    constructor() public {
        owner = msg.sender;
    }

    modifier OnlyOwner(address _address) {
        require(_address == owner, "No tiene permisos para ejecutar esta funcion");
        _;
    }

    // funcion que verifica si una persona puede votar, es decir, si aun no votó
    modifier VotoUnico(string memory _id) {
        bytes32 clave = keccak256(abi.encodePacked(_id));
        // verifica si el id de la persona ya esta registrada en el mapping de votantes
        require(keccak256(abi.encodePacked(votantes[clave])) == keccak256(abi.encodePacked("")), "Esta persona ya voto");
        _;
    }

    // alta de candidatos
    function nuevo_candidato(string memory _id, string memory _nombre, uint _edad) public {
        bytes32 hash_datos = keccak256(abi.encodePacked(_id, _nombre, _edad));
        candidatos[_nombre] = Candidato(_id, _nombre, _edad, hash_datos);
        votos_candidato[_nombre] = 0;
        nombres_candidatos.push(_nombre);
    }

    function listar_candidatos() public view returns(string[] memory){
        return nombres_candidatos;
    }

    function consultar_candidato(string memory _nombre) public view returns(Candidato memory) {
        return candidatos[_nombre];
    }

    // funcion que le permite a una persona votar
    function votar(string memory _id_votante, string memory _nombre_candidato) public VotoUnico(_id_votante){
        votos_candidato[_nombre_candidato] += 1;
        votantes[keccak256(abi.encodePacked(_id_votante))] = _nombre_candidato;
    }

    // dado el nombre de un candidato devuelve la cantidad de votos del mismo
    function ver_votos_candidato(string memory _nombre_candidato) public view returns(uint){
        return votos_candidato[_nombre_candidato];
    }

    function resultados_votacion() public view returns(string memory){
        string memory resultado = "";
        for (uint i=0; i<nombres_candidatos.length; i++){
            resultado = string(abi.encodePacked(resultado,"(",nombres_candidatos[i]," : ", uint2str(votos_candidato[nombres_candidatos[i]])," votos)"));
        }
        return resultado;
    }

    // retorna el candidatos con mas votos
    function ganador_votacio() public view returns(string memory){
        string memory nombre_ganador;
        uint votos_ganador = 0;
        bool empate = false;
        for (uint i=0; i<nombres_candidatos.length; i++){
            if (votos_candidato[nombres_candidatos[i]] > votos_ganador){
                votos_ganador = votos_candidato[nombres_candidatos[i]];
                nombre_ganador = nombres_candidatos[i];
                empate = false;
            } else if (votos_candidato[nombres_candidatos[i]] == votos_ganador){
                empate = true;
            }

        }
        if (empate)
            return "No hay un ganador, hubo un empate.";
        else 
            return string(abi.encodePacked("El ganador de la votacion es ",nombre_ganador," con ",uint2str(votos_ganador)," votos."));
    }

    //Funcion auxiliar que transforma un uint a un string
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}