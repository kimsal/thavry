#!/usr/bin/env python
from flask_wtf import Form
from wtforms import DateTimeField,TextField,FileField,PasswordField, IntegerField, TextAreaField, SubmitField, RadioField,SelectField,validators, ValidationError
from flaskckeditor import CKEditor
class PostForm(Form,CKEditor):
   title = TextField("Title",[validators.Required("Please enter your title.")])
   description = TextAreaField("Description",[validators.Required("Please enter your description.")])   
   feature_image = FileField("Feature Image")
   price = TextField("Price")
   category_id = SelectField('Category', choices=[], coerce=int)
   submit = SubmitField("Publish")

class CategoryForm(Form):
   name = TextField("Name",[validators.Required("Please enter category name.")])
class PageForm(Form,CKEditor):
	title = TextField("Title",[validators.Required("Please enter your title.")])
	description = TextAreaField("Description",[validators.Required("Please enter your description.")])
class UserMemberForm(Form):
   name = TextField("Name",[validators.Required("Please enter your name.")])
   email = TextField("Email",[validators.Required("Please enter your email.")])
   password = PasswordField("Password",[validators.Required("Please enter your password.")])
   submit = SubmitField("Login")
class SearchForm(Form):
    search = TextField("search")
class SearchForm(Form):
    q = TextField("Search ...")
class BookingForm(Form):
    firstname = TextField("First Name",[validators.Required("Please enter your first name.")])
    lastname = TextField("Last Name",[validators.Required("Please enter your last name.")])
    email = TextField("Email",[validators.Required("Please enter your email.")])
    phone = TextField("Phone",[validators.Required("Please enter your phone number.")])
    amount=TextField("Amount")
    description = TextAreaField("Description",[validators.Required("Please enter your description.")])   
   
    post_id = SelectField('Post', choices=[], coerce=int)