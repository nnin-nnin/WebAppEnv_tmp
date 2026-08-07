<?php
return [
  0 => [
    'route' => '/Activities/:parentType/:id/composeEmailAddressList',
    'method' => 'get',
    'actionClassName' => 'Espo\\Modules\\Crm\\Tools\\Activities\\Api\\GetComposeAddressList',
    'adjustedRoute' => '/Activities/{parentType}/{id}/composeEmailAddressList'
  ],
  1 => [
    'route' => '/Activities/:parentType/:id/:type',
    'method' => 'get',
    'actionClassName' => 'Espo\\Modules\\Crm\\Tools\\Activities\\Api\\Get',
    'adjustedRoute' => '/Activities/{parentType}/{id}/{type}'
  ],
  2 => [
    'route' => '/Activities/:parentType/:id/:type/list/:targetType',
    'method' => 'get',
    'actionClassName' => 'Espo\\Modules\\Crm\\Tools\\Activities\\Api\\GetListTyped',
    'adjustedRoute' => '/Activities/{parentType}/{id}/{type}/list/{targetType}'
  ],
  3 => [
    'route' => '/Activities/upcoming',
    'method' => 'get',
    'actionClassName' => 'Espo\\Modules\\Crm\\Tools\\Activities\\Api\\GetUpcoming',
    'adjustedRoute' => '/Activities/upcoming'
  ],
  4 => [
    'route' => '/Activities',
    'method' => 'get',
    'actionClassName' => 'Espo\\Modules\\Crm\\Tools\\Calendar\\Api\\GetCalendar',
    'adjustedRoute' => '/Activities'
  ],
  5 => [
    'route' => '/Timeline',
    'method' => 'get',
    'actionClassName' => 'Espo\\Modules\\Crm\\Tools\\Calendar\\Api\\GetTimeline',
    'adjustedRoute' => '/Timeline'
  ],
  6 => [
    'route' => '/Timeline/busyRanges',
    'method' => 'get',
    'actionClassName' => 'Espo\\Modules\\Crm\\Tools\\Calendar\\Api\\GetBusyRanges',
    'adjustedRoute' => '/Timeline/busyRanges'
  ],
  7 => [
    'route' => '/Meeting/:id/attendees',
    'method' => 'get',
    'params' => [
      'controller' => 'Meeting',
      'action' => 'attendees'
    ],
    'adjustedRoute' => '/Meeting/{id}/attendees'
  ],
  8 => [
    'route' => '/Call/:id/attendees',
    'method' => 'get',
    'params' => [
      'controller' => 'Call',
      'action' => 'attendees'
    ],
    'adjustedRoute' => '/Call/{id}/attendees'
  ],
  9 => [
    'route' => '/Campaign/:id/generateMailMerge',
    'method' => 'post',
    'actionClassName' => 'Espo\\Modules\\Crm\\Tools\\Campaign\\Api\\PostGenerateMailMerge',
    'adjustedRoute' => '/Campaign/{id}/generateMailMerge'
  ],
  10 => [
    'route' => '/TargetList/:id/optedOut',
    'method' => 'get',
    'actionClassName' => 'Espo\\Modules\\Crm\\Tools\\TargetList\\Api\\GetOptedOut',
    'adjustedRoute' => '/TargetList/{id}/optedOut'
  ],
  11 => [
    'route' => '/',
    'method' => 'get',
    'params' => [
      'controller' => 'ApiIndex',
      'action' => 'index'
    ],
    'adjustedRoute' => '/'
  ],
  12 => [
    'route' => '/App/user',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\App\\Api\\GetUser',
    'adjustedRoute' => '/App/user'
  ],
  13 => [
    'route' => '/App/destroyAuthToken',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\App\\Api\\PostDestroyAuthToken',
    'adjustedRoute' => '/App/destroyAuthToken'
  ],
  14 => [
    'route' => '/App/about',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\App\\Api\\GetAbout',
    'adjustedRoute' => '/App/about'
  ],
  15 => [
    'route' => '/Metadata',
    'method' => 'get',
    'params' => [
      'controller' => 'Metadata'
    ],
    'adjustedRoute' => '/Metadata'
  ],
  16 => [
    'route' => '/I18n',
    'method' => 'get',
    'params' => [
      'controller' => 'I18n'
    ],
    'noAuth' => true,
    'adjustedRoute' => '/I18n'
  ],
  17 => [
    'route' => '/Settings',
    'method' => 'get',
    'params' => [
      'controller' => 'Settings'
    ],
    'noAuth' => true,
    'adjustedRoute' => '/Settings'
  ],
  18 => [
    'route' => '/Settings',
    'method' => 'patch',
    'params' => [
      'controller' => 'Settings'
    ],
    'adjustedRoute' => '/Settings'
  ],
  19 => [
    'route' => '/Settings',
    'method' => 'put',
    'params' => [
      'controller' => 'Settings'
    ],
    'adjustedRoute' => '/Settings'
  ],
  20 => [
    'route' => '/Stream',
    'method' => 'get',
    'params' => [
      'controller' => 'Stream',
      'action' => 'list',
      'scope' => 'User'
    ],
    'adjustedRoute' => '/Stream'
  ],
  21 => [
    'route' => '/GlobalStream',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\Stream\\Api\\GetGlobal',
    'adjustedRoute' => '/GlobalStream'
  ],
  22 => [
    'route' => '/GlobalSearch',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\GlobalSearch\\Api\\Get',
    'adjustedRoute' => '/GlobalSearch'
  ],
  23 => [
    'route' => '/LeadCapture/:apiKey',
    'method' => 'post',
    'params' => [
      'controller' => 'LeadCapture',
      'action' => 'leadCapture',
      'apiKey' => ':apiKey'
    ],
    'noAuth' => true,
    'adjustedRoute' => '/LeadCapture/{apiKey}'
  ],
  24 => [
    'route' => '/LeadCapture/:apiKey',
    'method' => 'options',
    'params' => [
      'controller' => 'LeadCapture',
      'action' => 'leadCapture',
      'apiKey' => ':apiKey'
    ],
    'noAuth' => true,
    'adjustedRoute' => '/LeadCapture/{apiKey}'
  ],
  25 => [
    'route' => '/:controller/action/:action',
    'method' => 'post',
    'params' => [
      'controller' => ':controller',
      'action' => ':action'
    ],
    'adjustedRoute' => '/{controller}/action/{action}'
  ],
  26 => [
    'route' => '/:controller/action/:action',
    'method' => 'put',
    'params' => [
      'controller' => ':controller',
      'action' => ':action'
    ],
    'adjustedRoute' => '/{controller}/action/{action}'
  ],
  27 => [
    'route' => '/:controller/action/:action',
    'method' => 'get',
    'params' => [
      'controller' => ':controller',
      'action' => ':action'
    ],
    'adjustedRoute' => '/{controller}/action/{action}'
  ],
  28 => [
    'route' => '/:controller/layout/:name',
    'method' => 'get',
    'params' => [
      'controller' => 'Layout',
      'scope' => ':controller'
    ],
    'adjustedRoute' => '/{controller}/layout/{name}'
  ],
  29 => [
    'route' => '/:controller/layout/:name',
    'method' => 'put',
    'params' => [
      'controller' => 'Layout',
      'scope' => ':controller'
    ],
    'adjustedRoute' => '/{controller}/layout/{name}'
  ],
  30 => [
    'route' => '/:controller/layout/:name/:setId',
    'method' => 'put',
    'params' => [
      'controller' => 'Layout',
      'scope' => ':controller'
    ],
    'adjustedRoute' => '/{controller}/layout/{name}/{setId}'
  ],
  31 => [
    'route' => '/Admin/rebuild',
    'method' => 'post',
    'params' => [
      'controller' => 'Admin',
      'action' => 'rebuild'
    ],
    'adjustedRoute' => '/Admin/rebuild'
  ],
  32 => [
    'route' => '/Admin/clearCache',
    'method' => 'post',
    'params' => [
      'controller' => 'Admin',
      'action' => 'clearCache'
    ],
    'adjustedRoute' => '/Admin/clearCache'
  ],
  33 => [
    'route' => '/Admin/jobs',
    'method' => 'get',
    'params' => [
      'controller' => 'Admin',
      'action' => 'jobs'
    ],
    'adjustedRoute' => '/Admin/jobs'
  ],
  34 => [
    'route' => '/Admin/fieldManager/:scope/:name',
    'method' => 'get',
    'params' => [
      'controller' => 'FieldManager',
      'action' => 'read',
      'scope' => ':scope',
      'name' => ':name'
    ],
    'adjustedRoute' => '/Admin/fieldManager/{scope}/{name}'
  ],
  35 => [
    'route' => '/Admin/fieldManager/:scope',
    'method' => 'post',
    'params' => [
      'controller' => 'FieldManager',
      'action' => 'create',
      'scope' => ':scope'
    ],
    'adjustedRoute' => '/Admin/fieldManager/{scope}'
  ],
  36 => [
    'route' => '/Admin/fieldManager/:scope/:name',
    'method' => 'put',
    'params' => [
      'controller' => 'FieldManager',
      'action' => 'update',
      'scope' => ':scope',
      'name' => ':name'
    ],
    'adjustedRoute' => '/Admin/fieldManager/{scope}/{name}'
  ],
  37 => [
    'route' => '/Admin/fieldManager/:scope/:name',
    'method' => 'patch',
    'params' => [
      'controller' => 'FieldManager',
      'action' => 'update',
      'scope' => ':scope',
      'name' => ':name'
    ],
    'adjustedRoute' => '/Admin/fieldManager/{scope}/{name}'
  ],
  38 => [
    'route' => '/Admin/fieldManager/:scope/:name',
    'method' => 'delete',
    'params' => [
      'controller' => 'FieldManager',
      'action' => 'delete',
      'scope' => ':scope',
      'name' => ':name'
    ],
    'adjustedRoute' => '/Admin/fieldManager/{scope}/{name}'
  ],
  39 => [
    'route' => '/CurrencyRate',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\Currency\\Api\\Get',
    'adjustedRoute' => '/CurrencyRate'
  ],
  40 => [
    'route' => '/CurrencyRate',
    'method' => 'put',
    'actionClassName' => 'Espo\\Tools\\Currency\\Api\\PutUpdate',
    'adjustedRoute' => '/CurrencyRate'
  ],
  41 => [
    'route' => '/Action',
    'method' => 'post',
    'actionClassName' => 'Espo\\Core\\Action\\Api\\PostProcess',
    'adjustedRoute' => '/Action'
  ],
  42 => [
    'route' => '/MassAction',
    'method' => 'post',
    'actionClassName' => 'Espo\\Core\\MassAction\\Api\\PostProcess',
    'adjustedRoute' => '/MassAction'
  ],
  43 => [
    'route' => '/MassAction/:id/status',
    'method' => 'get',
    'actionClassName' => 'Espo\\Core\\MassAction\\Api\\GetStatus',
    'adjustedRoute' => '/MassAction/{id}/status'
  ],
  44 => [
    'route' => '/MassAction/:id/subscribe',
    'method' => 'post',
    'actionClassName' => 'Espo\\Core\\MassAction\\Api\\PostSubscribe',
    'adjustedRoute' => '/MassAction/{id}/subscribe'
  ],
  45 => [
    'route' => '/Export',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Export\\Api\\PostProcess',
    'adjustedRoute' => '/Export'
  ],
  46 => [
    'route' => '/Export/:id/status',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\Export\\Api\\GetStatus',
    'adjustedRoute' => '/Export/{id}/status'
  ],
  47 => [
    'route' => '/Export/:id/subscribe',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Export\\Api\\PostSubscribe',
    'adjustedRoute' => '/Export/{id}/subscribe'
  ],
  48 => [
    'route' => '/Import',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Import\\Api\\Post',
    'adjustedRoute' => '/Import'
  ],
  49 => [
    'route' => '/Import/file',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Import\\Api\\PostFile',
    'adjustedRoute' => '/Import/file'
  ],
  50 => [
    'route' => '/Import/:id/revert',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Import\\Api\\PostRevert',
    'adjustedRoute' => '/Import/{id}/revert'
  ],
  51 => [
    'route' => '/Import/:id/removeDuplicates',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Import\\Api\\PostRemoveDuplicates',
    'adjustedRoute' => '/Import/{id}/removeDuplicates'
  ],
  52 => [
    'route' => '/Import/:id/unmarkDuplicates',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Import\\Api\\PostUnmarkDuplicates',
    'adjustedRoute' => '/Import/{id}/unmarkDuplicates'
  ],
  53 => [
    'route' => '/Import/:id/exportErrors',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Import\\Api\\PostExportErrors',
    'adjustedRoute' => '/Import/{id}/exportErrors'
  ],
  54 => [
    'route' => '/Kanban/order',
    'method' => 'put',
    'actionClassName' => 'Espo\\Tools\\Kanban\\Api\\PutOrder',
    'adjustedRoute' => '/Kanban/order'
  ],
  55 => [
    'route' => '/Kanban/:entityType',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\Kanban\\Api\\GetData',
    'adjustedRoute' => '/Kanban/{entityType}'
  ],
  56 => [
    'route' => '/Attachment/file/:id',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\Attachment\\Api\\GetFile',
    'adjustedRoute' => '/Attachment/file/{id}'
  ],
  57 => [
    'route' => '/Attachment/chunk/:id',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Attachment\\Api\\PostChunk',
    'adjustedRoute' => '/Attachment/chunk/{id}'
  ],
  58 => [
    'route' => '/Attachment/fromImageUrl',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Attachment\\Api\\PostFromImageUrl',
    'adjustedRoute' => '/Attachment/fromImageUrl'
  ],
  59 => [
    'route' => '/Attachment/copy/:id',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Attachment\\Api\\PostCopy',
    'adjustedRoute' => '/Attachment/copy/{id}'
  ],
  60 => [
    'route' => '/EmailTemplate/:id/prepare',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\EmailTemplate\\Api\\PostPrepare',
    'adjustedRoute' => '/EmailTemplate/{id}/prepare'
  ],
  61 => [
    'route' => '/Email/:id/attachments/copy',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\PostAttachmentsCopy',
    'adjustedRoute' => '/Email/{id}/attachments/copy'
  ],
  62 => [
    'route' => '/Email/sendTest',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\PostSendTest',
    'adjustedRoute' => '/Email/sendTest'
  ],
  63 => [
    'route' => '/Email/inbox/read',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\PostInboxRead',
    'adjustedRoute' => '/Email/inbox/read'
  ],
  64 => [
    'route' => '/Email/inbox/read',
    'method' => 'delete',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\DeleteInboxRead',
    'adjustedRoute' => '/Email/inbox/read'
  ],
  65 => [
    'route' => '/Email/inbox/important',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\PostInboxImportant',
    'adjustedRoute' => '/Email/inbox/important'
  ],
  66 => [
    'route' => '/Email/inbox/important',
    'method' => 'delete',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\DeleteInboxImportant',
    'adjustedRoute' => '/Email/inbox/important'
  ],
  67 => [
    'route' => '/Email/inbox/inTrash',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\PostInboxInTrash',
    'adjustedRoute' => '/Email/inbox/inTrash'
  ],
  68 => [
    'route' => '/Email/inbox/inTrash',
    'method' => 'delete',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\DeleteInboxInTrash',
    'adjustedRoute' => '/Email/inbox/inTrash'
  ],
  69 => [
    'route' => '/Email/inbox/folders/:folderId',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\PostFolder',
    'adjustedRoute' => '/Email/inbox/folders/{folderId}'
  ],
  70 => [
    'route' => '/Email/inbox/notReadCounts',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\GetNotReadCounts',
    'adjustedRoute' => '/Email/inbox/notReadCounts'
  ],
  71 => [
    'route' => '/Email/insertFieldData',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\Email\\Api\\GetInsertFieldData',
    'adjustedRoute' => '/Email/insertFieldData'
  ],
  72 => [
    'route' => '/EmailAddress/search',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\EmailAddress\\Api\\GetSearch',
    'adjustedRoute' => '/EmailAddress/search'
  ],
  73 => [
    'route' => '/User/:id/stream/own',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\Stream\\Api\\GetOwn',
    'adjustedRoute' => '/User/{id}/stream/own'
  ],
  74 => [
    'route' => '/User/:id/acl',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\UserSecurity\\Api\\GetUserAcl',
    'adjustedRoute' => '/User/{id}/acl'
  ],
  75 => [
    'route' => '/UserSecurity/apiKey/generate',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\UserSecurity\\Api\\PostApiKeyGenerate',
    'adjustedRoute' => '/UserSecurity/apiKey/generate'
  ],
  76 => [
    'route' => '/UserSecurity/password',
    'method' => 'put',
    'actionClassName' => 'Espo\\Tools\\UserSecurity\\Api\\PutPassword',
    'adjustedRoute' => '/UserSecurity/password'
  ],
  77 => [
    'route' => '/UserSecurity/password/recovery',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\UserSecurity\\Api\\PostPasswordRecovery',
    'adjustedRoute' => '/UserSecurity/password/recovery'
  ],
  78 => [
    'route' => '/UserSecurity/password/generate',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\UserSecurity\\Api\\PostPasswordGenerate',
    'adjustedRoute' => '/UserSecurity/password/generate'
  ],
  79 => [
    'route' => '/User/passwordChangeRequest',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\UserSecurity\\Api\\PostPasswordChangeRequest',
    'noAuth' => true,
    'adjustedRoute' => '/User/passwordChangeRequest'
  ],
  80 => [
    'route' => '/User/changePasswordByRequest',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\UserSecurity\\Api\\PostChangePasswordByRequest',
    'noAuth' => true,
    'adjustedRoute' => '/User/changePasswordByRequest'
  ],
  81 => [
    'route' => '/Oidc/authorizationData',
    'method' => 'get',
    'params' => [
      'controller' => 'Oidc',
      'action' => 'authorizationData'
    ],
    'noAuth' => true,
    'adjustedRoute' => '/Oidc/authorizationData'
  ],
  82 => [
    'route' => '/Oidc/backchannelLogout',
    'method' => 'post',
    'params' => [
      'controller' => 'Oidc',
      'action' => 'backchannelLogout'
    ],
    'noAuth' => true,
    'adjustedRoute' => '/Oidc/backchannelLogout'
  ],
  83 => [
    'route' => '/:controller/:id',
    'method' => 'get',
    'params' => [
      'controller' => ':controller',
      'action' => 'read',
      'id' => ':id'
    ],
    'adjustedRoute' => '/{controller}/{id}'
  ],
  84 => [
    'route' => '/:controller',
    'method' => 'get',
    'params' => [
      'controller' => ':controller',
      'action' => 'index'
    ],
    'adjustedRoute' => '/{controller}'
  ],
  85 => [
    'route' => '/:controller',
    'method' => 'post',
    'params' => [
      'controller' => ':controller',
      'action' => 'create'
    ],
    'adjustedRoute' => '/{controller}'
  ],
  86 => [
    'route' => '/:controller/:id',
    'method' => 'put',
    'params' => [
      'controller' => ':controller',
      'action' => 'update',
      'id' => ':id'
    ],
    'adjustedRoute' => '/{controller}/{id}'
  ],
  87 => [
    'route' => '/:controller/:id',
    'method' => 'patch',
    'params' => [
      'controller' => ':controller',
      'action' => 'update',
      'id' => ':id'
    ],
    'adjustedRoute' => '/{controller}/{id}'
  ],
  88 => [
    'route' => '/:controller/:id',
    'method' => 'delete',
    'params' => [
      'controller' => ':controller',
      'action' => 'delete',
      'id' => ':id'
    ],
    'adjustedRoute' => '/{controller}/{id}'
  ],
  89 => [
    'route' => '/:entityType/:id/followers',
    'method' => 'get',
    'actionClassName' => 'Espo\\Tools\\Stream\\Api\\GetFollowers',
    'adjustedRoute' => '/{entityType}/{id}/followers'
  ],
  90 => [
    'route' => '/:entityType/:id/followers',
    'method' => 'post',
    'actionClassName' => 'Espo\\Tools\\Stream\\Api\\PostFollowers',
    'adjustedRoute' => '/{entityType}/{id}/followers'
  ],
  91 => [
    'route' => '/:entityType/:id/followers',
    'method' => 'delete',
    'actionClassName' => 'Espo\\Tools\\Stream\\Api\\DeleteFollowers',
    'adjustedRoute' => '/{entityType}/{id}/followers'
  ],
  92 => [
    'route' => '/:controller/:id/stream',
    'method' => 'get',
    'params' => [
      'controller' => 'Stream',
      'action' => 'list',
      'id' => ':id',
      'scope' => ':controller'
    ],
    'adjustedRoute' => '/{controller}/{id}/stream'
  ],
  93 => [
    'route' => '/:controller/:id/posts',
    'method' => 'get',
    'params' => [
      'controller' => 'Stream',
      'action' => 'listPosts',
      'id' => ':id',
      'scope' => ':controller'
    ],
    'adjustedRoute' => '/{controller}/{id}/posts'
  ],
  94 => [
    'route' => '/:controller/:id/updateStream',
    'method' => 'get',
    'params' => [
      'controller' => 'Stream',
      'action' => 'listUpdates',
      'id' => ':id',
      'scope' => ':controller'
    ],
    'adjustedRoute' => '/{controller}/{id}/updateStream'
  ],
  95 => [
    'route' => '/:controller/:id/subscription',
    'method' => 'put',
    'params' => [
      'controller' => ':controller',
      'id' => ':id',
      'action' => 'follow'
    ],
    'adjustedRoute' => '/{controller}/{id}/subscription'
  ],
  96 => [
    'route' => '/:controller/:id/subscription',
    'method' => 'delete',
    'params' => [
      'controller' => ':controller',
      'id' => ':id',
      'action' => 'unfollow'
    ],
    'adjustedRoute' => '/{controller}/{id}/subscription'
  ],
  97 => [
    'route' => '/:controller/:id/:link',
    'method' => 'get',
    'params' => [
      'controller' => ':controller',
      'action' => 'listLinked',
      'id' => ':id',
      'link' => ':link'
    ],
    'adjustedRoute' => '/{controller}/{id}/{link}'
  ],
  98 => [
    'route' => '/:controller/:id/:link',
    'method' => 'post',
    'params' => [
      'controller' => ':controller',
      'action' => 'createLink',
      'id' => ':id',
      'link' => ':link'
    ],
    'adjustedRoute' => '/{controller}/{id}/{link}'
  ],
  99 => [
    'route' => '/:controller/:id/:link',
    'method' => 'delete',
    'params' => [
      'controller' => ':controller',
      'action' => 'removeLink',
      'id' => ':id',
      'link' => ':link'
    ],
    'adjustedRoute' => '/{controller}/{id}/{link}'
  ]
];
