*Settings*
Documentation   Suite de Teste do Cadastro de personagens na API da Marvel

Library     RequestsLibrary
Library     ${EXECDIR}/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem

    Account and Set Headers

    &{personagem}     Factory Thanos
    # ${personagem}   Create Dictionary   
    # ...             name=Thanos de Titã     
    # ...             alliases=Thanos     
    # ...             age=3000    
    # ...             team=Ordem Negra    
    # ...             active=false
    
    ${response}       POST               
    ...               http://marvel.qaninja.academy/characters    
    ...               json=${personagem}
    ...               headers=${headers}

    Status Should Be    200     ${response}

*Keywords*
Account and Set Headers

    &{usuario}        Create Dictionary   email=manzato89@gmail.com  

    ${response}       POST    
    ...               http://marvel.qaninja.academy/accounts    
    ...               json=${usuario}

    ${client_key}     Set Variable          ${response.json()}[client_key]
    ${HEADERS}        Create Dictionary     client_key=${client_key}
    Set Suite Variable      ${HEADERS}   