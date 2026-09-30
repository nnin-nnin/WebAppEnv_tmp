import os

MONGO_HOST = os.environ.get('MONGO_HOST', 'mongo')
MONGO_PORT = int(os.environ.get('MONGO_PORT', 27017))
MONGO_DBNAME = os.environ.get('MONGO_DBNAME', 'eve')

RESOURCE_METHODS = ['GET', 'POST', 'DELETE']
ITEM_METHODS = ['GET', 'PATCH', 'PUT', 'DELETE']

PUBLIC_METHODS = ['GET']
PUBLIC_ITEM_METHODS = ['GET']

HATEOAS = True
PAGINATION = True

people = {
    'item_title': 'person',
    'resource_methods': ['GET', 'POST', 'DELETE'],
    'item_methods': ['GET', 'PATCH', 'PUT', 'DELETE'],
    'public_methods': ['GET'],
    'public_item_methods': ['GET'],
    'schema': {
        'firstname': {
            'type': 'string',
            'minlength': 1,
            'maxlength': 50,
        },
        'lastname': {
            'type': 'string',
            'minlength': 1,
            'maxlength': 50,
            'required': True,
        },
        'role': {
            'type': 'list',
            'allowed': ['admin', 'author', 'contributor', 'user'],
        },
    },
}

works = {
    'item_title': 'work',
    'resource_methods': ['GET', 'POST', 'DELETE'],
    'item_methods': ['GET', 'PATCH', 'PUT', 'DELETE'],
    'public_methods': ['GET'],
    'public_item_methods': ['GET'],
    'schema': {
        'title': {
            'type': 'string',
            'required': True,
        },
        'description': {
            'type': 'string',
        },
    },
}

users = {
    'item_title': 'user',
    'resource_methods': ['GET', 'POST', 'DELETE'],
    'item_methods': ['GET', 'PATCH', 'PUT', 'DELETE'],
    'public_methods': [],
    'public_item_methods': [],
    'allowed_roles': ['admin', 'Administrator'],
    'schema': {
        'username': {
            'type': 'string',
            'required': True,
            'unique': True,
        },
        'password': {
            'type': 'string',
            'required': True,
        },
        'role': {
            'type': 'string',
        },
        'email': {
            'type': 'string',
        },
    },
}

DOMAIN = {
    'people': people,
    'works': works,
    'users': users,
}
