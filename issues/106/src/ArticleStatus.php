<?php

interface ArticleStatus
{
    public function convert(): Status;
}