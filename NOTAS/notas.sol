// SPDX-License-Identifier: UNLICENCED
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

// ---------------------------------
//   ALUMNO    |    ID    |    NOTA  
// ---------------------------------
//  Marcos        77755N        5
//  Joan          12345X        9
//  Maria         02468T        2
//  Marta         13579U        3
//  Alba          98765Z        5

contract notas {
    // direccion del profesor
    address public profesor;

    // Constructor
    constructor() public {
        profesor = msg.sender;
    }

    // mapping para relacionar el hash del id de cada alumno con su calificacion del examen
    mapping (bytes32 => uint) calificaciones;

    // array de los alumnos que soliciten una revisión
    string[] revisiones;

    event alumno_evaluado(bytes32, uint);
    event evento_revision(string);

    // permite verificar que quien despliegue el contrato sea el profesor (el owner del contrato)
    modifier UnicamenteProfesor(address _direccion) {
        require(_direccion == profesor, "No tiene permisos para ejecutar esta funcion");
        _;
    }

    //funcion para evaluar a un alumno
    function evaluar(string memory _idAlumno, uint _nota) public UnicamenteProfesor(msg.sender) {
        bytes32 hash_idAlumno = keccak256(abi.encodePacked(_idAlumno)); // hash del id del alumno
        calificaciones[hash_idAlumno] = _nota; // agrego la calificacion al mapping
        emit alumno_evaluado(hash_idAlumno, _nota);
    }

    // funcion que permite consultar la calificacion de un alumno usando su ID
    function consultar_nota(string memory _idAlumno) public view returns(uint){
        bytes32 hash_idAlumno = keccak256(abi.encodePacked(_idAlumno));
        return calificaciones[hash_idAlumno];
    }

    // funcion que permite a un alumno solicitar una revision
    function solicitar_revision(string memory _idAlumno) public {
        revisiones.push(_idAlumno);
        emit evento_revision(_idAlumno);
    }

    function listar_revisiones() public view UnicamenteProfesor(msg.sender) returns(string[] memory){
        return revisiones;
    }





}


