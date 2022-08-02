<?php

/**
 * @method Status release()
 * @method Status close()
 */
enum Status: string
{
    case DRAFT = 'draft';
    case RELEASED = 'released';
    case CLOSED = 'closed';

    public function __call(string $name, array $arguments)
    {
        return match ($name) {
            'release' => match ($this) {
                self::DRAFT => Status::RELEASED,
            },
            'close' => match ($this) {
                self::DRAFT, self::RELEASED => Status::CLOSED,
            },
            default => throw new LogicException()
        };
    }
}