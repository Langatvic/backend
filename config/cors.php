<?php

return [
    'paths' => ['api/*', 'sanctum/csrf-cookie', 'login', 'logout', 'register'],
    'allowed_methods' => ['*'],
    'allowed_origins' => [
        'http://localhost:3000',
        'http://localhost:5000',
        'http://10.0.2.2:8000',
        'https://batch-undermost-snugly.ngrok-free.dev',
        '*.ngrok-free.dev',
    ],
    'allowed_origins_patterns' => [
        '/^https?:\/\/.*\.ngrok-free\.dev$/',
    ],
    'allowed_headers' => ['*'],
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => true,
];