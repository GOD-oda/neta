<?php

require_once __DIR__ . '/ArticleStatus.php';
require_once __DIR__ . '/AStatus.php';
require_once __DIR__ . '/BStatus.php';
require_once __DIR__ . '/Status.php';

$aStatus = AStatus::from('opened');
echo $aStatus->value . "\n";
echo $aStatus->convert()->value . "\n";
var_dump(Status::DRAFT->release());

$bStatus = BStatus::from('published');
echo $bStatus->value . "\n";
echo $bStatus->convert()->value . "\n";