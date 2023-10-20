from database import db
from flask import Flask, render_template, request, redirect, url_for
from datetime import datetime
from flask_migrate import Migrate
from models import Tickets, Comentario

app = Flask(__name__)

    #configuración de la Base de Datos
USER_DB = 'postgres'
PASS_DB = 'admin'
URL_DB = 'localhost'
NAME_DB = 'tickets_db'
FULL_URL_DB = f'postgresql://{USER_DB}:{PASS_DB}@{URL_DB}/{NAME_DB}'

app.config['SQLALCHEMY_DATABASE_URI']= FULL_URL_DB
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
#Inicialización del objeto db de sqlalchemy
#db = SQLAlchemy(app)
db.init_app(app)


#configurar flask-migrate
migrate = Migrate()
migrate.init_app(app, db)

tickets = []

class Ticket:
    def __init__(self, titulo, descripcion, creador):
        self.titulo = titulo
        self.descripcion = descripcion
        self.estado = "Pendiente"
        self.fecha_creacion = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        self.comentarios = []
        self.creador = creador

    def cambiar_estado(self, nuevo_estado):
        estados_validos = ["Pendiente", "En Progreso", "Finalizado"]
        if nuevo_estado in estados_validos:
            self.estado = nuevo_estado
        else:
            print("Estado no válido.")

    def agregar_comentario(self, comentario):
        self.comentarios.append(comentario)


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        titulo = request.form['titulo']
        descripcion = request.form['descripcion']
        creador = request.form['creador']
        # Crear un nuevo Ticket y guardarlo en la base de datos
        nuevo_ticket = Tickets(titulo=titulo, descripcion=descripcion, estado="Pendiente", creador=creador)
        db.session.add(nuevo_ticket)
        db.session.commit()

        return redirect(url_for('ver_ticket'))
    return render_template('index.html')


@app.route('/comentar/<int:ticket_id>', methods=['POST'])
def comentar(ticket_id):
    comentario = request.form['comentario']
    ticket = Tickets.query.get(ticket_id)

    if ticket:
        nuevo_comentario = Comentario(contenido=comentario, ticket=ticket)
        db.session.add(nuevo_comentario)
        db.session.commit()

    return redirect(url_for('ver_detalle', id=ticket_id))




@app.route('/cambiar_estado/<int:ticket_id>', methods=['POST'])
def cambiar_estado(ticket_id):
    nuevo_estado = request.form['nuevo_estado']
    # Obtén el ticket de la base de datos
    ticket = Tickets.query.get(ticket_id)
    if ticket:
        # Actualiza el estado del ticket
        ticket.estado = nuevo_estado
        db.session.commit()

    return redirect(url_for('ver_ticket'))


@app.route('/ver_ticket')
def ver_ticket():
    # Obtén los tickets de la base de datos
    tickets = Tickets.query.all()
    return render_template('ver_ticket.html', tickets=tickets)



@app.route('/ver_tickets')
def ticket():
    #Listado de tickets
    tickets = Tickets.query.all()
    total_tickets = Tickets.query.count()
    app.logger.debug(f'Listado de Tickets:  {tickets}')
    app.logger.debug(f'Total de Tickets: {total_tickets}')
    return render_template('ver_ticket.html', tickets = tickets, total_tickets = total_tickets)

@app.route('/ver/<int:id>')
def ver_detalle(id):
    #recuperamos el ticket según el id proporcionado
    ticket =Tickets.query.get(id)
    app.logger.debug(f'Ver ticket: {ticket}')
    return render_template('detalle.html',ticket=ticket)

@app.route('/ver_tickets_realizados')
def ver_tickets():
    # Tu lógica para mostrar la tabla de tickets
    return render_template('ver_ticket.html')


if __name__ == '__main__':
    app.run(debug=True)