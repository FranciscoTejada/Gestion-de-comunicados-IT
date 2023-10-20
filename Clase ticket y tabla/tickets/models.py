from app import db
from datetime import datetime


class Tickets(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(250), nullable=False)
    descripcion = db.Column(db.String(255), nullable=False)
    estado = db.Column(db.String(20), nullable=False)
    fecha_creacion = db.Column(db.DateTime, default=datetime.utcnow)
    creador = db.Column(db.String(100), nullable=False)
    comentarios = db.relationship('Comentario', backref='ticket', lazy=True)

    def agregar_comentario(self, contenido):
        nuevo_comentario = Comentario(contenido=contenido, ticket_id=self.id)
        db.session.add(nuevo_comentario)
        db.session.commit()


class Comentario(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    contenido = db.Column(db.String(255), nullable=False)
    ticket_id = db.Column(db.Integer, db.ForeignKey('tickets.id'), nullable=False)