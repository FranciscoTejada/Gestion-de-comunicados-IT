"""empty message

Revision ID: 31c9600d561c
Revises: a291bee34c3d
Create Date: 2023-10-13 11:48:54.681872

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '31c9600d561c'
down_revision = 'a291bee34c3d'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('comentario',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('contenido', sa.String(length=255), nullable=False),
    sa.Column('ticket_id', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['ticket_id'], ['tickets.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    with op.batch_alter_table('tickets', schema=None) as batch_op:
        batch_op.add_column(sa.Column('creador', sa.String(length=100), nullable=False))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('tickets', schema=None) as batch_op:
        batch_op.drop_column('creador')

    op.drop_table('comentario')
    # ### end Alembic commands ###
