<?php

namespace ProcessMaker\Package\PackageSkeleton\Console\Commands;

use Illuminate\Console\Command;

class Uninstall extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'package-skeleton:uninstall';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Uninstall Package Skeleton Package';

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $this->info('Package Skeleton package Uninstalled');
    }
}
