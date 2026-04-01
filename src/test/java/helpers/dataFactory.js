function fn(type) {
    var random = java.util.UUID.randomUUID() + '';

    if (type == 'edit') {
        return {
            nome: 'Miguel Editado',
            email: 'edit_' + random + '@mail.com',
            password: '123456',
            administrador: 'true'
        };
    }

    if (type == 'invalid') {
        return {
            nome: '',
            email: 'correo-invalido',
            password: '123',
            administrador: 'true'
        };
    }

    return {
        nome: 'Miguel QA',
        email: 'miguel_' + random + '@mail.com',
        password: '123456',
        administrador: 'true'
    };
}