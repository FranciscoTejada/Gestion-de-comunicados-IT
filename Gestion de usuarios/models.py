from datetime import datetime

import pytz

from app import db


class Persona(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    usuario = db.Column(db.String(250))
    contrasenia = db.Column(db.String(250))
    email = db.Column(db.String(250))
    departamento = db.Column(db.String(250))

    def __str__(self):
        return (
            f'Id: {self.id},'
            f'Usuario: {self.usuario},'
            f'Contrasenia: {self.contrasenia},'
            f'Email: {self.email},'
            f'Departamento: {self.departamento},'
        )


# Parte de fran

class Tickets(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(250), nullable=False)
    descripcion = db.Column(db.String(255), nullable=False)
    estado = db.Column(db.String(20), nullable=False)
    fecha_creacion = db.Column(db.DateTime, default=datetime.now(pytz.timezone('America/Argentina/Buenos_Aires')).strftime('%Y-%m-%d %H:%M:%S'))
    creador = db.Column(db.String(100), nullable=False)
    comentarios = db.relationship('Comentario', backref='ticket', lazy=True)
    cambios_estado = db.relationship('CambiosEstadoTicket', backref='ticket', lazy='dynamic')

    def __str__(self):
        return (
            f'Id: {self.id},'
            f'Titulo: {self.titulo},'
            f'Descripcion: {self.descripcion},'
            f'Estado: {self.estado},'
            f'Fecha_creacion: {self.fecha_creacion},'
            f'Creador: {self.creador},'
            f'Comentarios: {self.comentarios},'
        )

    def agregar_comentario(self, contenido):
        nuevo_comentario = Comentario(contenido=contenido, ticket_id=self.id)
        db.session.add(nuevo_comentario)
        db.session.commit()


    def cambiar_estado(self, nuevo_estado, usuario):
        # Cambiar el estado del ticket
        self.estado = nuevo_estado
        # Registrar el cambio de estado
        cambio_estado = CambiosEstadoTicket(ticket=self, usuario=usuario, estado=nuevo_estado)
        db.session.add(cambio_estado)
        db.session.commit()


class Comentario(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    contenido = db.Column(db.String(255), nullable=False)
    ticket_id = db.Column(db.Integer, db.ForeignKey('tickets.id'), nullable=False)


class CambiosEstadoTicket(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    ticket_id = db.Column(db.Integer, db.ForeignKey('tickets.id'))
    usuario = db.Column(db.String(100))
    estado = db.Column(db.String(20))
    fecha = db.Column(db.DateTime, default=datetime.now(pytz.timezone('America/Argentina/Buenos_Aires')).strftime('%Y-%m-%d %H:%M:%S'))


