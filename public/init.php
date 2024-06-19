<?php
require 'vendor/autoload.php';

$config = include('config.php');

\Stripe\Stripe::setApiKey($config['stripe']['secret_key']);
