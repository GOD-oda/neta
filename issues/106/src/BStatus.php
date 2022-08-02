<?php

enum BStatus: string implements ArticleStatus
{
    case PUBLISHED = 'published';

    public function convert(): Status
    {
        return match ($this) {
            self::PUBLISHED => Status::RELEASED
        };
    }
}