"""empty message

Revision ID: 6acf52c85562
Revises: 
Create Date: 2023-10-10 16:17:50.748705

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '6acf52c85562'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('persona',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('usuario', sa.String(length=250), nullable=True),
    sa.Column('contrasenia', sa.String(length=250), nullable=True),
    sa.Column('email', sa.String(length=250), nullable=True),
    sa.Column('departamento', sa.String(length=250), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('persona')
    # ### end Alembic commands ###
