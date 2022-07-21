<?php

namespace App\Usecase;

use App\Domain\Task;
use App\Domain\TaskRepository;

class CreateTask
{
    public function __construct(private TaskRepository $taskRepository) {}

    public function exec(string $title): void
    {
        $task = new Task($title);
        $this->taskRepository->store($task);
    }
}
