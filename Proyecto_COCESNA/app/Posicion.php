<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Posicion extends Model
{
    protected $table = 'posicion';
    public $timestamps = false;
    protected $fillable = [
        'posicion',
    ];

    public function personal()
    {
        return $this->hasMany('App\Personal'); //relacion uno a muchos
    }
}
