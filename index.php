<?php

enum Test: int
{
    case create = 1;
}

$value = Test::from(1);
die('SUCCESS');
