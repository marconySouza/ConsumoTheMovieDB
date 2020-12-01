O PROJETO É A CRIAÇÃO DE UMA API DE COMUNICAÇÃO COM NOSSA APLICAÇÃO DO FRONTEND, ESTE PROJETO É APENAS UM BACKEND ALTERNATIVO COM O INTUITO DE FORNECER SERVIÇOS QUE GARANTE PERSISTÊNCIA E CONSULTA DO BANCO DE DADOS.

DEPENDENCIAS:

* JAVA 11
* UNIREST
* SPRING BOOT
* POSTGRESQL
* JSON SIMPLE

OS SERVIÇOS(URLS) E SCHEMAS QUE SÃO DISPONIBILIZADOS VIA API:

//serviço para login de users
localhost:9090/services/sign-in 

TYPE: POST

BODY:
String username
String password

-------------------------------------
//serviço para consulta de todos os diretores(botar os diretores em um combobox na hora de responder as perguntas)
localhost:9090/services/directors

TYPE: GET

SCHEMA:
[
    "Alexander Payne",
    "Nando Cicero",
    "Jean-Claude Van Damme",
    "Judd Apatow"
]

RETURN: LIST<STRING>
--------------------------
//serviço para consulta de todos os generos(botar os generos em um combobox na hora de responder as perguntas)
localhost:9090/services/genres

TYPE: GET

SCHEMA: 

[
    {
        "id": 10752,
        "name": "Guerra"
    },
    {
        "id": 37,
        "name": "Faroeste"
    }
]

RETURN: LIST<GENRES>
----------------------------
//Consultar lista de filmes e séries salvas
localhost:9090/services/my-list

TYPE: GET

SCHEMA:

{
    "MOVIES": [
        {
            "director": "Aki Kaurismäki",
            "overview": "Taisto Kasurinen trabalha numa mina de carvão que passa por graves problemas. Seu pai comete suicídio e ele acaba sendo preso por um crime que não cometeu. Na cadeia, ele começa a sonhar em começar uma nova vida em outro país e planeja escapar da prisão.",
            "poster_path": "https://image.tmdb.org/t/p/original/ojDg0PGvs6R9xYFodRct2kdI6wC.jpg",
            "original_language": "fi",
            "id": 2,
            "title": "Ariel",
            "backdrop_path": "https://image.tmdb.org/t/p/original/hQ4pYsIbP22TMXOUdSfC2mjWrO0.jpg",
            "release_date": "1988-10-20",
            "genres": [
                {
                    "id": 18,
                    "name": "Drama"
                },
                {
                    "id": 80,
                    "name": "Crime"
                },
                {
                    "id": 35,
                    "name": "Comédia"
                }
            ]
        }
    ],
    "TVSHOWS": [
        {
            "overview": "",
            "poster_path": "https://image.tmdb.org/t/p/original/h9qveCyL3m6tNOrdhUabZk7khKt.jpg",
            "original_language": "en",
            "id": 10,
            "name": "All in Good Faith",
            "number_of_seasons": null,
            "number_of_episodes": null,
            "first_air_date": "1985-12-29",
            "genres": [
                {
                    "id": 35,
                    "name": "Comédia"
                }
            ],
            "popularity": 0.0
        }
    ]
}

BODY:
String idUser

RETURN: MAP<STRING, LIST<?>> (LISTA DE FILMES E SÉRIES SEPARADAS, CADA TIPO EM SUA DEVIDA LISTA)
-----------------------------------------
//Salva filmes ou séries na lista de salvos do usuario
localhost:9090/services/save-my-list

TYPE: POST

BODY:
String idEntertainment(serie ou filme) 
String idUser
String type (passar nessa string os valores 'filme' ou 'serie' para cadastro dos dados nas listas corretas)
------------------------------
//Envia uma sugestão de filme ou série baseada nas respostas das perguntas dos usuarios
localhost:9090/services/sugestion

TYPE: GET

SCHEMA:

[
    {
        "director": "Catherine Hardwicke",
        "overview": "Isabella Swan (Kristen Stewart) e seu pai, Charlie (Billy Burke), mudaram-se recentemente. No novo colégio ela logo conhece Edward Cullen (Robert Pattinson), um jovem admirado por todas as garotas locais e que mantém uma aura de mistério em torno de si. Eles aos poucos se apaixonam, mas Edward sabe que isto põe a vida de Isabella em risco.",
        "poster_path": "https://image.tmdb.org/t/p/original//sgxHeCZE3H9n5jQFumQPs9HBnTV.jpg",
        "original_language": "en",
        "id": 8966,
        "title": "Crepúsculo",
        "backdrop_path": "https://image.tmdb.org/t/p/original//7eK8FJr4fqq3J5W2xvlr2GVaep2.jpg",
        "release_date": "2008-11-19",
        "genres": [
            {
                "id": 14,
                "name": "Fantasia"
            },
            {
                "id": 18,
                "name": "Drama"
            },
            {
                "id": 10749,
                "name": "Romance"
            }
        ]
    },
    {
        "director": "Tim Burton",
        "overview": "As famílias de Victor e Victoria estão arranjando seu casamento. Nervoso com a cerimônia, Victor vai sozinho à floresta para ensaiar seus votos. No entanto, o que ele pensava ser um tronco de árvore na verdade é o braço esquelético de Emily, uma noiva que foi assassinada depois de fugir com seu amor. Convencida que Victor acabara de lhe pedir a mão em casamento, Emily o leva para o mundo dos mortos, mas ele precisa retornar rapidamente antes que Victoria se case com o malvado Lorde Barkis.",
        "poster_path": "https://image.tmdb.org/t/p/original//tms7ulCuyhXyvMHd9Gyg9J6MMph.jpg",
        "original_language": "en",
        "id": 3933,
        "title": "A Noiva Cadáver",
        "backdrop_path": "https://image.tmdb.org/t/p/original//r4VumNLSafeGhlieKNhGv0BQ4UD.jpg",
        "release_date": "2005-09-11",
        "genres": [
            {
                "id": 10749,
                "name": "Romance"
            },
            {
                "id": 14,
                "name": "Fantasia"
            },
            {
                "id": 16,
                "name": "Animação"
            }
        ]
    }

BODY:
String idGenre(id dos generos(combobox))
String director(nome do diretor(combobox))
Date beginDate(intervalo inicial de lançamento, imprescindivel que esse parametro seja passado da seguinte maneira -> 2020-12-01 (ANO/MÊS/DIA))
Date endDate(intervalo final de lançamento, imprescindivel que esse parametro seja passado da seguinte maneira -> 2020-12-01 (ANO/MÊS/DIA))
String type('filme' ou 'serie')

RETURN LIST<?>
----------------------------
//serviço para criação de users
localhost:9090/services/create-user 

TYPE: POST

BODY:
String username
String password

//serviço para alteração de users
localhost:9090/services/create-user 

TYPE: POST

BODY:
String idUser
String username
String password


======================================== DATABASE =========================================== 
O ARQUIVO BACKUP DO BANCO DE DADOS COM TODOS OS FILMES E SERIES JÁ POVOADOS ESTÁ DENTRO DA PASTA RESOURCES NO PROJETO

CASO NÃO SAIBAM IMPORTAR UM BANCO DE DADOS PRO POSTGRESQL, TEM VARIOS VIDEOS NO YOUTUBE ENSINANDO, O PROCESSO É SIMPLÓRIO.

NECESSÁRIO SE ATENTAR A CLASSE "DBCONNECTION" POIS LÁ QUE ESTÁ OS DADOS DE CONEXÃO AO BANCO DE DADOS, SE HOUVER NECESSIDADE DE MUDANÇA DE ALGUM DADO DE CONEXÃO, SERÁ POR LÁ QUE HAVERÁ A MUDANÇA. 

====================================== APLICAÇÃO .JAR ====================================== 

JUNTO DO BANCO DE DADOS DENTRO DA PASTA RESOURCES CONTEM O ARQUIVO .JAR DA APLICAÇÃO TOTALMENTE FUNCIONAL, BASTA APENAS INSTALAR O BANCO DE DADOS NA SUA MAQUINA, ABRIR A CONEXÃO DO BANCO DE DADOS E RODAR A APLICAÇÃO. A APLICAÇÃO ESTÁ SUBINDO EM UM SERVIDOR TOMCAT EMBUTIDO QUE ESTÁ REDIRECIONADO PARA A PORTA 9090, CASO A PORTA JÁ ESTEJA EM USO, UTILIZE O COMANDO 'java -jar -Dserver.port=8080 netfoundAPI.jar'(CMD) DENTRO DA PASTA QUE SE ENCONTRA A APLICAÇÃO.  
