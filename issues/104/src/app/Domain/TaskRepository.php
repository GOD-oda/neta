<?php

namespace App\Domain;

interface TaskRepository
{
    public function store(Task $task): void;
}

