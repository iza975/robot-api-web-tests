*** Settings ***
Library            SeleniumLibrary
Library            String
Documentation      Keywords usadas para geração de dados randômicos


*** Keywords ***

# Dados Randomicos de Usuários
Gerar Nome Completo
    # Gerar a primeira palavra com três letras "A"
    ${primeira_palavra}=    Generate Random String    6    chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ

    # Gerar a segunda palavra
    ${segunda_palavra}=     Generate Random String    8    chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ

    # Concatenar a primeira e segunda palavra
    ${nome_completo}=       Catenate    AAAA${primeira_palavra}  ${segunda_palavra}
    
    # Retornar o nome completo
    RETURN    ${nome_completo}


Gerar Numero de CPF randômico
    ${random_number}=    Generate Random String    11   [NUMBERS]
    RETURN    ${random_number}

Gerar E-mail Randômico (@dominio.com)
    # Gerar valor randômico de até 8 caracteres
    ${valor_randomico}=    Evaluate    ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))    modules=random,string

    # Concatenar o e-mail completo
    ${email}=    Catenate    usuario123${valor_randomico}@teste.com

    # Retornar o e-mail gerado
    RETURN    ${email}

Gerar E-mail Randômico (@dominio.com.br)
    # Gerar valor randômico de até 8 caracteres
    ${valor_randomico}=    Evaluate    ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))    modules=random,string

    # Concatenar o e-mail completo
    ${email}=    Catenate    usuario456${valor_randomico}@teste.com.br

    # Retornar o e-mail gerado
    RETURN    ${email}


# Dados Randomicos de Empresas
Gerar Razao Social
    # Gerar a primeira palavra com três letras "A"
    ${primeira_palavra}=    Generate Random String    4    chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ

    # Gerar a segunda palavra
    ${segunda_palavra}=     Generate Random String    4    chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ

    # Concatenar a primeira e segunda palavra
    ${nome_razaoSocial}=       Catenate    Razao${primeira_palavra}  123${segunda_palavra}
    
    # Retornar o nome completo
    RETURN    ${nome_razaoSocial}


Gerar Nome Fantasia
    # Gerar a primeira palavra com três letras "A"
    ${primeira_palavra}=    Generate Random String    6    chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ

    # Gerar a segunda palavra
    ${segunda_palavra}=     Generate Random String    8    chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ

    # Concatenar a primeira e segunda palavra
    ${nome_fantasia}=       Catenate    Nome${primeira_palavra}  Fantasia123${segunda_palavra}
    
    # Retornar o nome completo
    RETURN    ${nome_fantasia}

Gerar E-mail Randômico (@company.com)
    # Gerar valor randômico de até 8 caracteres
    ${valor_randomico}=    Evaluate    ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))    modules=random,string

    # Concatenar o e-mail completo
    ${email}=    Catenate    company123${valor_randomico}@teste.com

    # Retornar o e-mail gerado
    RETURN    ${email}

Gerar E-mail Randômico (@company.com.br)
    # Gerar valor randômico de até 8 caracteres
    ${valor_randomico}=    Evaluate    ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))    modules=random,string

    # Concatenar o e-mail completo
    ${email}=    Catenate    company456${valor_randomico}@teste.com.br

    # Retornar o e-mail gerado
    RETURN    ${email}

Gerar Numero de CNPJ randômico
    ${random_cnpj}=    Generate Random String    14   [NUMBERS]
    RETURN    ${random_cnpj}