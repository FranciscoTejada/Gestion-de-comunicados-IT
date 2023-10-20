"""empty message

Revision ID: a291bee34c3d
Revises: 
Create Date: 2023-10-13 00:20:33.581080

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'a291bee34c3d'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('tickets',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('titulo', sa.String(length=250), nullable=False),
    sa.Column('descripcion', sa.String(length=255), nullable=False),
    sa.Column('estado', sa.String(length=20), nullable=False),
    sa.Column('fecha_creacion', sa.DateTime(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('tickets')
    # ### end Alembic commands ###
