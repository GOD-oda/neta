<?php

namespace Tests\Usecase;

use Tests\TestCase;
use App\Domain\Task;
use App\Domain\TaskRepository;
use App\Usecase\CreateTask;

class CreateTaskTest extends TestCase
{
    public function testExec()
    {
        $expected = 'foo';

        $mock = \Mockery::mock(TaskRepository::class);
        $mock->expects()
            ->store(\Mockery::on(function ($actual) use ($expected) {
                $this->assertInstanceOf(Task::class, $actual);
                $this->assertSame($expected, $actual->title());
                return true;
            }))
            ->andReturn();
        $this->app->instance(TaskRepository::class, $mock);

        $usecase = $this->app->make(CreateTask::class);
        $usecase->exec('foo');
    }
}

