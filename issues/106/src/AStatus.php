<?php

enum AStatus: string implements ArticleStatus
{
    case OPEN = 'open';
    case OPENED = 'opened';

    public function convert(): Status
    {
        return match ($this) {
            self::OPEN, self::OPENED => Status::RELEASED
        };
    }
}