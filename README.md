# 🚀 Reto de Automatización QA Backend - ServeRest API

Suite de pruebas automatizadas para la API de Usuarios de ServeRest desarrollada con **Karate DSL**, cubriendo operaciones CRUD, validación de contratos JSON, happy paths y unhappy paths.

---

## 📌 Objetivo

Automatizar la API de Usuarios de ServeRest:

- `GET /usuarios`
- `POST /usuarios`
- `GET /usuarios/{id}`
- `PUT /usuarios/{id}`
- `DELETE /usuarios/{id}`

---

## 🛠️ Tecnologías utilizadas

- Java 17+ / JDK 21+ ✅
- Maven ✅
- Karate DSL 1.5.0 ✅
- IntelliJ IDEA ✅
- Git / GitHub ✅

---

## 📂 Estructura del proyecto

```text
src
└── test
    ├── java
    │   ├── features
    │   │   ├── getUsers.feature
    │   │   ├── getUserById.feature
    │   │   ├── createUser.feature
    │   │   ├── editUser.feature
    │   │   ├── deleteUser.feature
    │   │   └── negativeCreateUser.feature
    │   │
    │   ├── helpers
    │   │   └── dataFactory.js
    │   │
    │   ├── runners
    │   │   └── UsersRunner.java
    │   │
    │   └── schemas
    │       ├── listUsersSchema.json
    │       ├── getUserSchema.json
    │       ├── createUserResponseSchema.json
    │       └── messageSchema.json
    │
    └── resources
        └── karate-config.js
```

---

## ⚙️ Configuración

**1. Clonar repositorio**
```bash
git clone https://github.com/MBGG8/reto-qa-backend.git
cd reto-qa-backend
```

**2. Instalar dependencias**
```bash
mvn clean install
```

---

## ▶️ Ejecución de pruebas

**Ejecutar toda la suite:**
```bash
mvn test
```

**Ejecutar un feature específico:**
```bash
mvn test -Dtest=UsersRunner
```

**Ejecutar por tag:**
```bash
mvn test -Dkarate.options="--tags @{..Tag que se desea ejecutar..}"
```

---

## ✅ Escenarios de Pruebas

### Happy Path
- [x] Listar usuarios
- [x] Registrar usuario
- [x] Buscar usuario por ID
- [x] Editar usuario
- [x] Eliminar usuario

### Unhappy Path
- [x] Email duplicado
- [x] Mostrar Usuario con ID Invalido
- [x] Tipo de dato inválido
- [x] Eliminar Usuario inexistente

---

## 📄 Reportes

Karate genera reportes HTML automáticos detallados después de cada ejecución. Puedes encontrarlos en:

```text
target/karate-reports
```

Para visualizarlos, abre el siguiente archivo en tu navegador:
```text
target/karate-reports/karate-summary.html
```

---

## 👨‍💻 Autor

**Miguel Gutierrez**