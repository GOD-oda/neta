<?php

namespace App\Domain;

class Task
{
    public function __construct(private string $title) {}

    public function title(): string
    {
        return $this->title;
    }
}

