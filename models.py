#!/usr/bin/env python
from database import *
from sqlalchemy.orm import relationship
from slugify import slugify
from wtforms.widgets import * #TextArea
from wtforms import * #TextField, IntegerField, TextAreaField, SubmitField, RadioField,SelectField,validators, ValidationError
import wtforms.widgets.core
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
class UserMember(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    email = db.Column(db.String(100),nullable=True,unique=True)
    password = db.Column(db.String(600))
    password2=db.Column(db.String(200))
    created_at=db.Column(db.TIMESTAMP,server_default=db.func.current_timestamp())
    post=db.relationship('Post', backref="user_member", lazy='dynamic')
    def verify_password(self, password):
        #return custom_app_context.encrypt(password) == self.password
        return custom_app_context.verify(password, self.password)
    def hash_password(self, password):
        self.password = custom_app_context.encrypt(password)
    def __init__(self, name, email, password):
        self.name = name
        self.email = email
        self.password = password
        self.password2 = password
    def add(user):
        db.session.add(user)
        return db.session.commit()
    def update(self):
        return db.session.commit()
    def delete(user):
        db.session.delete(user)
        return db.session.commit()
    @staticmethod
    def verify_auth_token(token):
        s = Serializer(SECRET_KEY)
        try:
            data = s.loads(token)
        except SignatureExpired:
            return None # valid token, but expired
        except BadSignature:
            return None # invalid token
        user = UserMember.query.get(data['id'])
        return user

class Category(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name=  db.Column(db.String(100),nullable=True,unique=True)
    slug= db.Column(db.String(100),nullable=True)
    posts=db.relationship('Post', backref="category", lazy='dynamic')
    is_menu=db.Column(db.Integer,nullable=True,default=0)
    def get_absolute_url(self):
        return ('Category', (), {'slug': self.slug,'id': self.id,})
    def __str__(self):
        return self.name
    def to_Json(self):
        return dict(id=self.id,
            name=self.name,
            slug=self.slug
            )
    def __init__(self, name):
        self.slug=slugify(name)
        self.name =name
    def add(category):
        db.session.add(category)
        return db.session.commit()
    def delete(category):
        db.session.delete(category)
        return db.session.commit()
class Page(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title= db.Column(db.String(255),nullable=True,unique=True)
    slug= db.Column(db.String(255),nullable=True)
    description = db.Column(db.Text,nullable=True)
    published_at= db.Column(db.TIMESTAMP,server_default=db.func.current_timestamp())
    is_menu=db.Column(db.Integer,nullable=True,default=0)
    def get_absolute_url(self):
        return ('Page', (), {'slug': self.slug,'id': self.id,})
    def __str__(self):
        return self.title
    def to_Json(self):
        return dict(id=self.id,
            title=self.title,
            slug=self.slug,
            description=self.description,
            published_at="{}".format(self.published_at)
            )
    def __init__(self, title,description):
        self.title = title
        self.slug =slugify(title)
        self.description=description
    def add(page):
        db.session.add(page)
        return db.session.commit()
    def delete(page):
        db.session.delete(page)
        return db.session.commit()
class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(255),nullable=True,unique=True)
    description = db.Column(db.Text,nullable=True)
    feature_image=db.Column(db.Text,nullable=True)
    slug=db.Column(db.String(255),nullable=True,unique=True)
    category_id=db.Column(db.Integer,db.ForeignKey('category.id'),nullable=True)
    images = db.Column(db.Text,nullable=True)
    price = db.Column(db.Float,nullable=True)
    user_id=db.Column(db.Integer,db.ForeignKey('user_member.id'))
    published_at=db.Column(db.TIMESTAMP,server_default=db.func.current_timestamp())
    views = db.Column(db.Integer, nullable=True)

    def to_Json(self):
        return dict(id=self.id,
            title=self.title,
            description=self.description,
            feature_image=self.feature_image,
            slug=self.slug,
            category_id=self.category_id,
            published_at="{}".format(self.published_at),
            view=self.view,
            images=self.images,
            price=self.price
            )
    def __init__(self, title, description, category_id, feature_image, user_id,images='',views=0,price=0):
        self.title = title
        self.slug =slugify(title)
        self.description = description
        self.feature_image = feature_image
        self.category_id = category_id
        self.user_id = user_id
        self.views=views,
        self.images=images,
        self.price=price
    def add(post):
        db.session.add(post)
        return db.session.commit()
    def update(self):
        return db.session.commit()
    def delete(post):
        db.session.delete(post)
        return db.session.commit()

class Booking(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    firstname  = db.Column(db.String(255))
    lastname  = db.Column(db.String(255))
    email  = db.Column(db.String(255))
    phone  = db.Column(db.String(255),nullable=True)
    amount = db.Column(db.Integer,nullable=True)
    description = db.Column(db.Text)
    published_at=db.Column(db.TIMESTAMP,server_default=db.func.current_timestamp())
    post_id=db.Column(db.Integer,db.ForeignKey('post.id'))
    def __str__(self):
        return self.name
    # def update(self):
    #     return db.session.commit()
    def to_Json(self):
        return dict(id=self.id,
            firstname=self.firstname,
            lastname = self.lastname,
            email=self.email,
            phone=self.phone,
            amount=self.amount,
            description=self.description,
            post_id = self.post_id
            )
    def __init__(self,firstname,lastname,email,phone,post_id,amount=1,description=''):
        self.firstname =firstname,
        self.lastname = lastname,
        self.email =email,
        self.phone =phone,
        self.amount=amount,
        self.description=description,
        self.post_id = post_id
    def add(booking):
        db.session.add(booking)
        return db.session.commit()
    def delete(booking):
        db.session.delete(booking)
        return db.session.commit()
class Contact(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name  = db.Column(db.String(255))
    slug  = db.Column(db.String(255))
    email  = db.Column(db.String(255))
    subject  = db.Column(db.String(255))
    message = db.Column(db.Text)
    published_at=db.Column(db.TIMESTAMP,server_default=db.func.current_timestamp())
    post_id=db.Column(db.Integer,db.ForeignKey('post.id'))
    def __str__(self):
        return self.name
    # def update(self):
    #     return db.session.commit()
    def to_Json(self):
        return dict(id=self.id,
            name=self.name,
            message=self.message,
            subject=self.subject,
            post_id = self.post_idm,
            slug=self.slug
            )
    def __init__(self,name,email,post_id,message='',subject=''):
        self.name =name,
        self.slug=slugify(name),    
        self.email =email,
        self.message=message,
        self.subject=subject,
        self.post_id = post_id
    def add(contact):
        db.session.add(contact)
        return db.session.commit()
    def delete(contact):
        db.session.delete(contact)
        return db.session.commit()
class RequestTrail(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name= db.Column(db.String(255),nullable=True,unique=True)
    slug= db.Column(db.String(255),nullable=True)
    email = db.Column(db.String(100),nullable=True)
    comment = db.Column(db.Text,nullable=True)
    published_at= db.Column(db.TIMESTAMP,server_default=db.func.current_timestamp())


    def __str__(self):
        return self.title
    def to_Json(self):
        return dict(id=self.id,
            name=self.name,
            email=self.email,
            comment=self.comment,
            published_at="{}".format(self.published_at)
            )
    def __init__(self, name,email,comment):
        self.name = name
        self.slug =slugify(name)
        self.email=email
        self.comment = comment
    def add(request_trail):
        db.session.add(request_trail)
        return db.session.commit()
    def delete(request_trail):
        db.session.delete(request_trail)
        return db.session.commit()
# class Contact(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     firstname  = db.Column(db.String(255))
#     lastname  = db.Column(db.String(255))
#     email  = db.Column(db.String(255),unique=True)
#     comment = db.Column(db.Text,nullable=True)
#     published_at=db.Column(db.TIMESTAMP,server_default=db.func.current_timestamp())
#     def __str__(self):
#         return self.name
#     # def update(self):
#     #     return db.session.commit()
#     def to_Json(self):
#         return dict(id=self.id,
#             firstname=self.firstname,
#             lastname=self.lastname,
#             email=self.email
#             )
#     def __init__(self,firstname,lastname,email,comment):
#         self.firstname =firstname,
#         self.lastname =lastname,
#         self.email =email
#         self.comment =comment
#     def add(contact):
#         db.session.add(contact)
#         return db.session.commit()
#     def delete(contact):
#         db.session.delete(contact)
#         return db.session.commit()
if __name__ == '__main__':
    app.secret_key = SECRET_KEY
    app.config['DEBUG'] = True
    # app.config['SESSION_TYPE'] = 'filesystem'
    app.debug = True
    manager.run()
    app.run()