<?php

use ProcessMaker\Package\PackageSkeleton\Http\Controllers\PackageSkeletonController;

Route::group(['middleware' => ['auth']], function () {
    Route::get('admin/package-skeleton', [PackageSkeletonController::class, 'index'])->name('package.skeleton.index');
    Route::get('package-skeleton', [PackageSkeletonController::class, 'index'])->name('package.skeleton.tab.index');
});
